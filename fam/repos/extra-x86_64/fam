#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/famd`
case "$1" in
  start)
    stat_busy "Starting File Alteration Monitor"
    if ck_daemon rpcbind; then
      echo "ERROR: Refusing to start fam without rpcbind running!" >&2
      stat_die
    fi
    if [ -z "$PID" ]; then
       /usr/sbin/famd -T 0 -c /etc/fam/fam.conf
    fi
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      add_daemon fam
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping File Alteration Monitor"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon fam
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
