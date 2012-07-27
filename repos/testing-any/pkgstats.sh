#!/bin/bash

pkgstatsver='2.2'
showonly=false
quiet=false
option='-q -s -S -4'

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
	echo 'Statistics are available at https://www.archlinux.de/?page=Statistics'
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
pacman -Qq > "${pkglist}"
moduleslist="$(mktemp --tmpdir modules.XXXXXX)"
if [[ -f /proc/modules ]]; then
	cat /proc/modules | awk '{ print $1 }' > "${moduleslist}"
fi
arch="$(uname -m)"
mirror="$(pacman -Sddp extra/pkgstats 2>/dev/null | sed -E 's#(.*/)extra/os/.*#\1#;s#(.*://).*@#\1#')"

if ${showonly}; then
	echo 'packages='
	cat  "${pkglist}"
	echo ''
	echo 'modules='
	cat "${moduleslist}"
	echo ''
	echo "arch=${arch}"
	echo "pkgstatsver=${pkgstatsver}"
	echo "mirror=${mirror}"
	echo "quiet=${quiet}"
else
	${quiet} || echo 'Submitting data...'
	curl ${option} -H 'Expect: ' \
		-A "pkgstats/${pkgstatsver}" \
		--data-urlencode "packages@${pkglist}" \
		--data-urlencode "modules@${moduleslist}" \
		--data-urlencode "arch=${arch}" \
		--data-urlencode "mirror=${mirror}" \
		--data-urlencode "quiet=${quiet}" \
		'https://www.archlinux.de/?page=PostPackageList' \
	|| echo 'Sorry, data could not be sent.' >&2
fi

rm -f "${pkglist}"
