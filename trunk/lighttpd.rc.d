#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/lighttpd`

case "$1" in
  start)
    stat_busy "Starting lighttpd Daemon"
    [ -z "$PID" ] && /usr/sbin/lighttpd -f /etc/lighttpd/lighttpd.conf >> /var/log/lighttpd/error.log 2>&1
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon lighttpd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping lighttpd Daemon"
    [ ! -z "$PID" ] && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon lighttpd
      rm -f /var/run/lighttpd/lighttpd.pid
      stat_done
    fi
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac