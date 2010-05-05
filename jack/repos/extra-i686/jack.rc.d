#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

# source application-specific settings
[ -f /etc/conf.d/jack ] && . /etc/conf.d/jack

PID=`pidof -o %PPID /usr/bin/jackd`

case "$1" in
  start)
    stat_busy "Starting JACK Daemon"
    [ -z "$PID" ] && /usr/bin/jackd $SERVER_PARAMS -d $DRIVER_PARAMS &> /dev/null &
    if [ ! -z "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      add_daemon jack
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping JACK Daemon"
    [ ! -z "$PID" ]  && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon jack
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
