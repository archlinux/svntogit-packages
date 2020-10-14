#!/usr/bin/bash

TRUSTED_KEY=trusted-key-$(date +%Y%m%d).key
DEST=/srv/ftp/other/packages/dnssec-anchors

update_key() {
  key=$1
  unbound-anchor -v -a root.key ||
  unbound-anchor -v -a root.key

  unbound-host -v -f root.key -t DNSKEY . |
  sed 's/ (secure)//;t;d' |
  sed 's/ has / IN /' |
  sed 's/ record / /' \
  > "${key}"

  # Cleanup created root.key
  rm root.key
}

update_key "${TRUSTED_KEY}"

scp "${TRUSTED_KEY}" repos.archlinux.org:${DEST}
