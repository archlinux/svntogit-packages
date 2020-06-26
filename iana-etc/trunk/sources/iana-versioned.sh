#!/usr/bin/bash

URLS=(
	https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xml
	https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xml
)

DEST=/srv/ftp/other/packages/iana-etc

curl="curl --silent --fail --location"

do_update() {
	url=$1
	date=$(
		$curl --head "$url" |
		sed 's/^Last-Modified: //;t;d' |
		date -f- +%Y%m%d
	)
	if [[ -z $date ]]; then
		return
	fi

	file=${url##*/}
	name=${file%.*}
	ext=${file##*.}
	versioned="$name-$date.$ext"

	if [[ ! -f "$versioned" ]]; then
		$curl --output "$versioned" "$url"
	fi
}

cd "$DEST"

for url in ${URLS[@]}; do
	do_update "$url"
done
