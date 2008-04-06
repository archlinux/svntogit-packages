#!/bin/bash

# source application-specific settings
TPOP3D_ARGS=
[ -f /etc/conf.d/tpop3d ] && . /etc/conf.d/tpop3d

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/sbin/tpop3d`
case "$1" in
  start)
    stat_busy "Starting tpop3d"
    [ -z "$PID" ] && /usr/sbin/tpop3d ${TPOP3D_ARGS}
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon tpop3d
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping tpop3d"
    [ ! -z "$PID" ] && kill $PID &> /dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon tpop3d
      stat_done
    fi
    ;;
  restart)
    $0 stop
    sleep 2
    $0 start
    ;;
  *)
    echo "usage: `basename $0` {start|stop|restart}"
esac
exit 0
