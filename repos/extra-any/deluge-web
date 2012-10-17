#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/deluged

PIDFILE=/run/deluge/deluge-web.pid
WEB_OPTIONS="-f $WEB_OPTIONS"

[[ -f $PIDFILE ]] && PID=$(<$PIDFILE)
[[ -z $PID ]] || kill -0 $PID || PID=

case "$1" in
  start)
    stat_busy "Starting Deluge WebUI"
    [[ -z $PID ]] && su -l -s /bin/sh -c "/usr/bin/deluge-web $WEB_OPTIONS >/dev/null" deluge
    if [ $? -gt 0 ]; then
      stat_fail
    else
      sleep 1
      echo $(pgrep -u deluge deluge-web) > $PIDFILE
      add_daemon deluge-web
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Deluge WebUI"
    [[ ! -z $PID ]] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm $PIDFILE
      rm_daemon deluge-web
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
