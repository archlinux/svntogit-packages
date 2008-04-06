#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

DAEMON_NAME=sfssd
SFSSD_PID=`pidof -o %PPID sfssd`
case "$1" in
  start)
    stat_busy "Starting $DAEMON_NAME"
    if [ ! -f /var/run/daemons/portmap ]; then 
      echo "ERROR: portmap is not running"
      stat_fail
      exit 1
    fi
    if [ ! -f /var/run/daemons/nfslock ]; then 
      echo "ERROR: nfslock is not running"
      stat_fail
      exit 1
    fi
    if [ ! -f /var/run/daemons/nfsd ]; then 
      echo "ERROR: nfsd is not running"
      stat_fail
      exit 1
    fi
    [ -z "$SFSSD_PID" ] && /usr/sbin/sfssd
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      echo `pidof -o %PPID sfssd` > /var/run/sfssd.pid
    fi
    add_daemon $DAEMON_NAME
    stat_done
    ;;

  stop)
    stat_busy "Stopping $DAEMON_NAME"
    [ ! -z "$SFSSD_PID" ]  && kill $SFSSD_PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      kill -9 $SFSSD_PID &> /dev/null
      rm /var/run/sfssd.pid &> /dev/null
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
