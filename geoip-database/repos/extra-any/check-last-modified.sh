#!/bin/bash -e

URLS=(https://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
      https://geolite.maxmind.com/download/geoip/database/GeoIPv6.dat.gz)

for url in ${URLS[@]}; do
	last_mod=$(curl -sI $url | grep ^Last-Modified: | cut -d' ' -f2- | tr -d '\r')
	echo "$last_mod (${url##*/})"
done
