#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/osspd


if [[ -z "$DSP_SLAVE" ]]; then
  # Autodetect
  if [[ -x /usr/bin/pulseaudio ]]; then
    DSP_SLAVE="/usr/sbin/ossp-padsp"
  else
    DSP_SLAVE="/usr/sbin/ossp-alsap"
  fi
fi

PID=`pidof -o %PPID /usr/sbin/osspd`
case "$1" in
  start)
    stat_busy "Starting OSS userspace bridge"
    if [ -z "$PID" ]; then 
      /sbin/modprobe cuse &>/dev/null
      /sbin/udevadm settle --quiet
      /usr/sbin/osspd --dsp-slave="$DSP_SLAVE"
    fi
    if [ -n "$PID" -o $? -gt 0 ]; then
      stat_fail
    else
      add_daemon osspd
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping OSS userspace bridge"
    [ -n "$PID" ] && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon osspd
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

# vim:set ft=sh:
