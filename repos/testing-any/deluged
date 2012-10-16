#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/deluged

PIDFILE=/run/deluge/deluged.pid
OPTIONS="-P $PIDFILE $OPTIONS"

[[ -f $PIDFILE ]] && PID=$(<$PIDFILE)
[[ -z $PID ]] || kill -0 $PID &>/dev/null || PID=

case "$1" in
  start)
    stat_busy "Starting Deluge Daemon"
    [[ -z $PID ]] && su -l -s /bin/sh -c "/usr/bin/deluged $OPTIONS >/dev/null" deluge
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon deluged
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Deluge Daemon"
    [[ ! -z $PID ]] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm -f $PIDFILE
      rm_daemon deluged
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
exit 0
