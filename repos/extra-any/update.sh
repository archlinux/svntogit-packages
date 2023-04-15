#!/bin/bash

set -eo pipefail

readonly upstream=https://mailfud.org/geoip-legacy

lastmod=$(curl -sI "$upstream/GeoIP.dat.gz" | grep -i last-modified | cut -d: -f2)
version=$(date -d "$lastmod" +%Y%m%d)

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
	curl --remote-name-all $upstream/GeoIP{,City,ASNum}{,v6}.dat.gz
EOF

sed -i -e "/^pkgver=/c pkgver=$version" -e "/^pkgrel=/c pkgrel=1" PKGBUILD
