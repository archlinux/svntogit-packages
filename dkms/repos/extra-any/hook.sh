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
dkms_tree='/var/lib/dkms'
install_tree='/usr/lib/modules'
source /etc/dkms/framework.conf

shopt -s nullglob

# parse stdin path to guess what do do
while read -r path; do
	if [[ "/$path" =~ ^$source_tree/([^/]+)-([^/]+)/dkms\.conf$ ]]; then
		# do $@ for each kernel with headers
		pushd "$install_tree" >/dev/null
		for incpath in */build/include; do
			dkms "$@" -m "${BASH_REMATCH[1]}" -v "${BASH_REMATCH[2]}" -k "${incpath%%/*}"
		done
		popd >/dev/null
	elif [[ "/$path" =~ ^$install_tree/([^/]+)/ ]]; then
		# do $@ once for each registered dkms module
		pushd "$dkms_tree" >/dev/null
		for mod in */*/source; do
			dkms "$@" -m "${mod%/source}" -k "${BASH_REMATCH[1]}"
		done
		popd >/dev/null
	else
		echo "Skipping invalid path: $path" >&2
	fi
done
