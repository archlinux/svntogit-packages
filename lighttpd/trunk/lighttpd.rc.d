#!/bin/bash

# source application-specific settings
[ -f /etc/conf.d/lighttpd ] && . /etc/conf.d/lighttpd

. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID ${DAEMON_NAME}`
case "$1" in
  start)
    stat_busy "Starting ${DAEMON_NAME}"
    [ -z "$PID" ] && ${DAEMON_PATH} -f ${DAEMON_CONF} >> $DAEMON_ERRLOG 2>&1
    if [ $? -gt 0 ]; then
      stat_fail
    else
      add_daemon ${DAEMON_NAME}
      stat_done
    fi
    ;;
  stop)
    stat_busy "Stopping ${DAEMON_NAME}"
    [ ! -z "$PID" ] && kill $PID &>/dev/null
    if [ $? -gt 0 ]; then
      stat_fail
    else
      rm_daemon ${DAEMON_NAME}
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
