#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`cat /var/run/apmd.pid 2>/dev/null`
case "$1" in
  start)
    stat_busy "Starting APM Daemon"
    if [ -z "$PID" ]; then 
       /usr/sbin/apmd -P /etc/apmd_proxy
    fi
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      add_daemon apmd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping APM Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon apmd
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
