#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

[ -f "/etc/conf.d/slapd" ] && . /etc/conf.d/slapd

PID=`pidof -o %PPID /usr/sbin/slapd`
case "$1" in
  start)
    stat_busy "Starting OpenLDAP"
    if [ -z "$PID" ]; then
      if [ -z "$SLAPD_SERVICES" ]; then
        /usr/sbin/slapd $SLAPD_OPTIONS
      else
        /usr/sbin/slapd -h "$SLAPD_SERVICES" $SLAPD_OPTIONS
      fi
      if [ $? -gt 0 ]; then
        stat_fail
      else
        stat_done
      fi
      add_daemon slapd
    else
      stat_fail
    fi
    ;;
  stop)
    stat_busy "Stopping OpenLDAP"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm -f /var/run/slapd.pid
      rm -f /var/run/slapd.args
      rm_daemon slapd
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 3
    $0 start
    ;;
  *)
    echo "usage: $0 {start|stop|restart}"  
esac
exit 0
