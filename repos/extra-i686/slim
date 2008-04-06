#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

lockfile=$(grep lockfile /etc/slim.conf |tr -s " " | cut -d" " -f2)
pid=$(pidof -o %PPID /usr/bin/slim)

case "$1" in
  start)
    stat_busy "Starting Simple Login Manager"
    [ -z "$pid" ] && /usr/bin/slim -d >/dev/null 2>&1
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon slim
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Simple Login Manager"
    rm -f $lockfile
    [ ! -z "$pid" ]  && kill $pid >/dev/null 2>&1
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon slim
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 3
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac

exit 0
