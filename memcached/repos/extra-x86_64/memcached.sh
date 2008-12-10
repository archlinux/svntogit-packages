#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/memcached

PID=`pidof -o %PPID /usr/bin/memcached`
case "$1" in
  start)
    stat_busy "Starting memcached"
    [ -z "$PID" ] && /usr/bin/memcached -d $MEMCACHED_ARGS
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      add_daemon memcached
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping memcached"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon memcached
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"
esac
