#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

get_pid() {
	pidof /usr/sbin/ulogd
}

case "$1" in
  start)
    stat_busy "Starting ulogd daemon"

    [ -f /var/run/ulog.pid ] && rm -f /var/run/ulog.pid
    PID=`get_pid`
    if [ -z "$PID" ]; then
       /usr/sbin/ulogd -d
      if [ $? -gt 0 ]; then
        stat_fail
        exit 1
      else
        echo `get_pid` > /var/run/ulogd.pid
        add_daemon ulogd
        stat_done
      fi
    else
      stat_fail
      exit 1
    fi
    ;;

  stop)
    stat_busy "Stopping ulog daemon"
    PID=`get_pid`
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
      exit 1
    else
      rm -f /var/run/ulogd.pid &> /dev/null
      rm_daemon ulogd
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
