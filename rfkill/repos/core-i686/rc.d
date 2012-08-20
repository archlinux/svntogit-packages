#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/rfkill

case "$1" in
  start)
    for device in ${RFKILL_BLOCK}; do
      stat_busy "Blocking rfkill device: ${device}"
      /usr/sbin/rfkill block ${device}
      if [ $? -eq 0 ]; then
        stat_done
      else
        stat_fail
      fi
    done
    for device in ${RFKILL_UNBLOCK}; do
      stat_busy "Unblocking rfkill device: ${device}"
      /usr/sbin/rfkill unblock ${device}
      if [ $? -eq 0 ]; then
        stat_done
      else
        stat_fail
      fi
    done
    ;;
  stop)
    ;;
  restart)
    $0 start
    ;;
  *)
    echo "usage: $0 {start}"
    exit 1
    ;;
esac
exit 0
