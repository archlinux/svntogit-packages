#!/bin/bash

set -eo pipefail

readonly upstream=https://mailfud.org/geoip-legacy/

version=$(curl -s "$upstream/build.log" | grep -Po 'CSV_\K[0-9]{8}' | sort -u)

if [[ ${#version} != 8 ]]; then
	echo >&2 'Unable to determine upstream database version'
	exit 1
fi

pkgver=$(. PKGBUILD; echo $pkgver)

if ((pkgver >= version)); then
	echo >&2 "Already at version $pkgver (>= $version upstream)"
	exit 1
fi

ssh -T sources.archlinux.org <<-EOF
	mkdir -p /srv/sources/other/packages/geoip-database/$version &&
	cd       /srv/sources/other/packages/geoip-database/$version &&
	wget -nc $upstream/GeoIP{,City,ASNum}{,v6}.dat.gz
EOF

sed -i -e "/^pkgver=/c pkgver=$version" -e "/^pkgrel=/c pkgrel=1" PKGBUILD
