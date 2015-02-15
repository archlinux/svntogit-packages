#!/bin/bash -e

# Unicode characters taken from pactree.c
UNICODE_IS_FUN="\u2514\u2500"

verbose=0
if [[ $1 == -v ]]; then
	verbose=1
fi

URLS=(https://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
      https://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz)

for url in ${URLS[@]}; do
	last_mod=$(curl -sI $url | grep ^Last-Modified: | cut -d' ' -f2- | tr -d '\r')
	echo "$last_mod (${url##*/})"

	if ((verbose)); then
		build_id=$(curl -s $url | gzip -cd | grep -ao '[0-9]* Build [0-9]*')
		echo -e "${UNICODE_IS_FUN}$build_id"
	fi
done
