#!/bin/bash

#
# Copyright © 2018 Sébastien Luttringer
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.

# display what to run and run it quietly
run() {
	echo "==> $*"
	"$@" > /dev/null
}

# check whether the dependencies of a module are installed
# $1: module name/module version
# $2: kernel version
check_dependency() { (
	source "$source_tree/${1/\//-}/dkms.conf"
	for dep in "${BUILD_DEPENDS[@]}"; do
		if ! [[ "$(dkms status -m "$dep" -k "$2")" =~ :[[:space:]]installed$ ]]; then
			exit 1
		fi
	done
	exit 0
) }

# check whether the modules should be built with this kernel version
# $1: module name/module version
# $2: kernel version
check_buildexclusive() {
	local BUILD_EXCLUSIVE_KERNEL=$(source "$source_tree/${1/\//-}/dkms.conf"; printf '%s\n' "$BUILD_EXCLUSIVE_KERNEL")
	[[ "$2" =~ $BUILD_EXCLUSIVE_KERNEL ]]
}

# handle actions on module addition/upgrade/removal
# $1: module name
# $2: module version
parse_module() {
	pushd "$install_tree" >/dev/null
	local path
	for path in */build/; do
		local kver="${path%%/*}"
		dkms_register "$1" "$2" "$kver"
	done
	popd >/dev/null
}

# handle actions on kernel addition/upgrade/removal
# $1: kernel version
parse_kernel() {
	local path
	for path in "$source_tree"/*-*/dkms.conf; do
		if [[ -f "$path" && "$path" =~ ^$source_tree/([^/]+)-([^/]+)/dkms\.conf$ ]]; then
			dkms_register "${BASH_REMATCH[1]}" "${BASH_REMATCH[2]}" "$1"
		fi
	done
}

# register a dkms module to install/remove
# this function suppress echo call for a module
# $1: module name, $2: module version, $3: kernel version
dkms_register() {
	DKMS_MODULES["$1/$2/$3"]=''
}

# install registered modules
dkms_install() {
	local nvk mod kver
	local -i retry=1

	while (( $retry > 0 )); do
		retry=0
		for nvk in "${!DKMS_MODULES[@]}"; do
			mod=${nvk%/*}
			kver=${nvk##*/}
			# do not build excluded modules
			if ! check_buildexclusive "$mod" "$kver"; then
				unset DKMS_MODULES[$nvk]
				continue
			# skip modules with missing kernel headers
			elif [[ ! -d "$install_tree/$kver/build/include" ]]; then
				DKMS_MODULES[$nvk]="Missing kernel headers"
				continue
			# skip modules with missing kernel package
			elif [[ ! -d "$install_tree/$kver/kernel" ]]; then
				DKMS_MODULES[$nvk]="Missing kernel modules tree"
				continue
			# postpone modules with missing dependencies
			elif ! check_dependency "$mod" "$kver"; then
				DKMS_MODULES[$nvk]="Missing dependency"
				continue
			fi
			# give it a try dkms
			run dkms install "$mod" -k "$kver"
			unset DKMS_MODULES[$nvk]
			# maybe this module was a dep of another, so we retry
			retry=1
		done
	done
}

# remove registered modules when built/installed
dkms_remove() {
	local nvk mod kver
	for nvk in "${!DKMS_MODULES[@]}"; do
		mod=${nvk%/*}
		kver=${nvk##*/}
		state=$(dkms status -m "$mod" -k "$kver")
		if [[ "$state" =~ :[[:space:]](built|installed)$ ]]; then
			run dkms remove "$mod" -k "$kver"
		fi
		unset DKMS_MODULES[$nvk]
	done
}

# show information about failed modules
show_errors() {
	local nvk mod kver
	for nvk in "${!DKMS_MODULES[@]}"; do
		mod=${nvk%/*}
		kver=${nvk##*/}
		echo "==> Unable to $DKMS_ACTION module $mod for kernel $kver: ${DKMS_MODULES[$nvk]}."
	done
}

# emulated program entry point
main() {
	[[ -n "$DKMS_ALPM_HOOK_DEBUG" ]] && set -x

	# prevent each dkms call from failing with authorization errors
	if (( EUID )); then
		echo 'You must be root to use this hook' >&2
		exit 1
	fi

	# register DKMS action
	case "$1" in
		install|remove)
			declare -r DKMS_ACTION="$1"
			;;
		*)
			echo "usage: ${0##*/} install|remove" >&2
			exit 1
			;;
	esac

	# dkms path from framework config
	# note: the alpm hooks which trigger this script use static path
	source_tree='/usr/src'
	install_tree='/usr/lib/modules'
	source /etc/dkms/framework.conf

	# check source_tree and install_tree exists
	local path
	for path in "$source_tree" "$install_tree"; do
		if [[ ! -d "$path" ]]; then
			echo "==> Missing mandatory directory: $path. Exiting!"
			return 1
		fi
	done

	# storage for DKMS modules to install/remove
	# we use associate arrays to prevent duplicate
	declare -A DKMS_MODULES

	# parse stdin paths to guess what do do
	while read -r path; do
		if [[ "/$path" =~ ^$source_tree/([^/]+)-([^/]+)/dkms\.conf$ ]]; then
			parse_module "${BASH_REMATCH[1]}" "${BASH_REMATCH[2]}"
		elif [[ "/$path" =~ ^$install_tree/([^/]+)/ ]]; then
			parse_kernel "${BASH_REMATCH[1]}"
		fi
	done

	dkms_$DKMS_ACTION

	show_errors

	return 0
}

main "$@"
