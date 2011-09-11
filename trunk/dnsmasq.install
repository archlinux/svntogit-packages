#!/bin/sh

add_dnsmasq_user() {
  if ! getent passwd dnsmasq >/dev/null; then
    useradd -r -d / -c 'dnsmasq daemon' -s /sbin/nologin dnsmasq
  fi
}

post_install() {
  add_dnsmasq_user
}

post_upgrade() {
  add_dnsmasq_user
}

post_remove() {
  if getent passwd dnsmasq >/dev/null; then
    userdel dnsmasq
  fi
}
