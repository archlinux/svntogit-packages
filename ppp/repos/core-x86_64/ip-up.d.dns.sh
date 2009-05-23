#!/bin/sh

if [ "$USEPEERDNS" = "1" -a -f /etc/ppp/resolv.conf ]; then
  [ -e /etc/resolv.conf ] && mv /etc/resolv.conf /etc/resolv.conf.backup.${IFNAME}
  mv /etc/ppp/resolv.conf /etc/resolv.conf
fi
