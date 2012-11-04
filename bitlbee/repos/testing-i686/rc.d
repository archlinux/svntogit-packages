#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

pidfile=/run/bitlbee/bitlbee.pid
if [[ -r $pidfile ]]; then
  read -r PID < "$pidfile"
  if [[ ! -d /proc/$PID ]]; then
    # stale pidfile
    unset PID
    rm -f "$pidfile"
  fi
fi

case $1 in
  start)
    stat_busy "Starting bitlbee daemon"
    if [[ $PID ]] || ! su -s /bin/sh -c '/usr/sbin/bitlbee -F' bitlbee; then
      stat_fail
      exit 1
    else
      add_daemon bitlbee
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping bitlbee daemon"
    if [[ -z $PID ]] || ! kill $PID &>/dev/null; then
      stat_fail
      exit 1
    else
      rm -f "$pidfile"
      rm_daemon bitlbee
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
    exit 1
    ;;
esac

# vim: set ft=sh et ts=2 sw=2:
