#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON_NAME=sfscd
SFSCD_PID=`pidof -o %PPID sfscd`
case "$1" in
  start)
    stat_busy "Starting $DAEMON_NAME"
    if [ ! -f /var/run/daemons/portmap ]; then 
      echo "ERROR: portmap is not running"
      stat_fail
      exit 1
    fi
    [ -z "$SFSCD_PID" ] && /usr/sbin/sfscd
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      echo `pidof -o %PPID sfscd` > /var/run/sfscd.pid
    fi
    add_daemon $DAEMON_NAME
    stat_done
    ;;

  stop)
    stat_busy "Stopping $DAEMON_NAME"
    [ ! -z "$SFSCD_PID" ]  && kill $SFSCD_PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      kill -9 $SFSCD_PID &> /dev/null
      rm /var/run/sfscd.pid &> /dev/null
    fi
    rm_daemon $DAEMON_NAME
    stat_done
    ;;

  restart)
    $0 stop
    sleep 2
    $0 start
    ;;

  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
