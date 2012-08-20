#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/transmissiond

PID=`pidof -o %PPID /usr/bin/transmission-daemon`
case "$1" in
  start)
    stat_busy "Starting Transmission Daemon"
    [ -z "$PID" ] && su -l -s /bin/sh -c "/usr/bin/transmission-daemon $TRANS_ARGS" "${TRANS_USER:-transmission}"
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon transmissiond
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping Transmission Daemon"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon transmissiond
      stat_done
    fi
    ;;
  restart)
    $0 stop
    while [ ! -z "$PID" -a -d "/proc/$PID" ]; do sleep 1; done
    $0 start
    ;;
  reload)
      stat_busy "Reloading config"
      [ ! -z "$PID" ] && kill -HUP $PID &> /dev/null
      if [ $? -gt 0 ]; then
          stat_fail
      else
          stat_done
      fi
      ;;
  *)
    echo "usage: $0 {start|stop|restart|reload}"
esac
exit 0
