#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

FS_CONTROL="/etc/firestarter/firestarter.sh"

if ! [ -f $FS_CONTROL ] ; then
  echo "Please run firestarter executable first manually as root to configure it initially"
  echo "You'll have to do that as root in a root console from in an X env"
fi

[ -x /usr/bin/firestarter ] || exit 0
[ -x $FS_CONTROL ] || exit 0
[ -s /etc/firestarter/configuration ] || exit 0
case "$1" in
  start)
    stat_busy "Starting Firestarter firewall"
    $FS_CONTROL start > /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon firestarter
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Firestarter firewall"
    $FS_CONTROL stop > /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon firestarter
      stat_done
    fi
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  lock)
    stat_busy "Locking Firestarter firewall"
    $FS_CONTROL lock > /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
    fi
    ;;
  *)
    echo "usage: $0 {start|stop|restart|lock}"
esac
exit 0
