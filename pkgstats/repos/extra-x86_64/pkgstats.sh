#!/bin/bash

pkglist=$(mktemp --tmpdir pkglist.XXXXXX)
pacman -Qq > ${pkglist}

curl -f -H 'Expect: ' \
	--data-urlencode "packages@${pkglist}" \
	--data-urlencode "arch=$(uname -m)" \
	--data-urlencode "pkgstatsver=1.0" \
	'http://www.archlinux.de/?page=PostPackageList' \
	|| echo 'Sorry, package list could not be sent.'

rm -f ${pkglist}
