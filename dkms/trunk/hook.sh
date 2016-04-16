#!/bin/bash

#
# Copyright © 2016 Sébastien Luttringer
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

# display what to run and run it
run() {
	echo "==> $*"
	"$@"
}

# check kernel is valid for action
# it means kernel and its headers are installed
# $1: kernel version
check_kernel() {
	local kver="$1"; shift
	if [[ ! -d "$install_tree/$kver/kernel" ]]; then
		echo "==> No kernel $kver modules. You must install them to use DKMS!"
		return 1
	elif [[ ! -d "$install_tree/$kver/build/include" ]]; then
		echo "==> No kernel $kver headers. You must install them to use DKMS!"
		return 1
	fi
	return 0
}

# handle actions on module addition/upgrade/removal
# $1: module name
# $2: module version
# $*: dkms args
do_module() {
	local modname="$1"; shift
	local modver="$1"; shift
	pushd "$install_tree" >/dev/null
	# do $@ for each kernel with headers for $modname v$modver
	local path
	for path in */build/; do
		local kver="${path%%/*}"
		check_kernel "$kver" || continue
		run dkms -q "$@" -m "$modname" -v "$modver" -k "$kver"
	done
	popd >/dev/null
}

# handle actions on kernel addition/upgrade/removal
# $1: kernel version
# $*: dkms args
do_kernel() {
	local kver="$1"; shift
	check_kernel "$kver" || return
	# do $@ once for each dkms module in $source_tree
	local path
	for path in "$source_tree"/*-*/dkms.conf; do
		if [[ "$path" =~ ^$source_tree/([^/]+)-([^/]+)/dkms\.conf$ ]]; then
			run dkms -q "$@" -m "${BASH_REMATCH[1]}" -v "${BASH_REMATCH[2]}" -k "$kver"
		fi
	done
}

# emulated program entry point
main() {
	# prevent to have all each dkms call to fail
	if (( EUID )); then
		echo 'You must be root to use this hook' >&2
		exit 1
	fi

	# check args count
	if (( $# < 1 )); then
		echo "usage: ${0##*/} dkms-arguments" >&2
		exit 1
	fi

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

	# parse stdin paths to guess what do do
	while read -r path; do
		if [[ "/$path" =~ ^$source_tree/([^/]+)-([^/]+)/dkms\.conf$ ]]; then
			do_module "${BASH_REMATCH[1]}" "${BASH_REMATCH[2]}" "$@"
		elif [[ "/$path" =~ ^$install_tree/([^/]+)/ ]]; then
			do_kernel "${BASH_REMATCH[1]}" "$@"
		fi
	done

	return 0
}

main "$@"
