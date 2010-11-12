#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PID=$(pidof -o %PPID /usr/bin/speech-dispatcher)
case "$1" in
  start)
    stat_busy "Starting speech dispatcher Daemon"
    [ -z "$PID" ] && /usr/bin/speech-dispatcher -d &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon speechd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping speech dispatcher Daemon"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon speechd
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
