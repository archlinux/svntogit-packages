#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/named

PIDFILE=/run/named/named.pid
PID=$(cat $PIDFILE 2>/dev/null)
readlink -q /proc/$PID/exe | grep -q '^/usr/sbin/named' || { PID=; rm $PIDFILE 2>/dev/null; }

case "$1" in
  start)
    stat_busy "Starting BIND"
    [ -z "$PID" ] && /usr/sbin/named ${NAMED_ARGS}
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon named
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping BIND"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon named
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  reload)
    stat_busy "Reloading BIND"
    [ ! -z "$PID" ] && rndc reload &>/dev/null || kill -HUP $PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      stat_done
    fi
    ;;
  *)
    echo "usage: $0 {start|stop|reload|restart}"
esac
exit 0
