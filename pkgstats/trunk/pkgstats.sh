#!/bin/bash

pkgstatsver='2.4'
showonly=false
quiet=false
option='-q -s -S -L'

usage() {
	echo "usage: ${0} [option]"
	echo 'options:'
	echo '	-v	show the version of pkgstats'
	echo '	-d	enable debug mode'
	echo '	-h	show this help'
	echo '	-s	show what information would be sent'
	echo '		(but do not send anything)'
	echo '	-q	be quiet except on errors'
	echo ''
	echo 'pkgstats sends a list of all installed packages,'
	echo 'the architecture and the mirror you are using'
	echo 'to the Arch Linux project.'
	echo ''
	echo 'Statistics are available at https://pkgstats.archlinux.de/'
}

while getopts 'vdhsq' parameter; do
	case ${parameter} in
		v)	echo "pkgstats, version ${pkgstatsver}"; exit 0;;
		d)	option="${option} --trace-ascii -";;
		s)	showonly=true;;
		q)	quiet=true;;
		*)	usage; exit 1;;
	esac
done

${quiet} || echo 'Collecting data...'
pkglist="$(mktemp --tmpdir pkglist.XXXXXX)"
trap 'rm -f "${pkglist}"' EXIT
pacman -Qq > "${pkglist}"
arch="$(uname -m)"
if [[ -f /proc/cpuinfo ]]; then
	if grep -qE '^flags\s*:.*\slm\s' /proc/cpuinfo; then
		cpuarch='x86_64'
	else
		cpuarch='i686'
	fi
else
	cpuarch=''
fi
mirror="$(pacman-conf --repo extra Server 2> /dev/null | head -1 | sed -E 's#(.*/)extra/os/.*#\1#;s#(.*://).*@#\1#')"

if ${showonly}; then
	echo 'packages='
	cat  "${pkglist}"
	echo ''
	echo "arch=${arch}"
	echo "cpuarch=${cpuarch}"
	echo "pkgstatsver=${pkgstatsver}"
	echo "mirror=${mirror}"
	echo "quiet=${quiet}"
else
	${quiet} || echo 'Submitting data...'
	curl ${option} \
		-A "pkgstats/${pkgstatsver}" \
		--data-urlencode "packages@${pkglist}" \
		--data-urlencode "arch=${arch}" \
		--data-urlencode "cpuarch=${cpuarch}" \
		--data-urlencode "mirror=${mirror}" \
		--data-urlencode "quiet=${quiet}" \
		'https://pkgstats.archlinux.de/post' \
	|| echo 'Sorry, data could not be sent.' >&2
fi
