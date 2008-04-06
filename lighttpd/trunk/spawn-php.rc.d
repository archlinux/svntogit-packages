#!/bin/bash

# source application-specific settings
[ -f /etc/conf.d/spawn-php ] && . /etc/conf.d/spawn-php

. /etc/rc.conf
. /etc/rc.d/functions


PID=`pidof -o %PPID ${FCGIPROGRAM}`
case "$1" in
  start)
    stat_busy "Starting ${SPAWN_DAEMON_NAME}"
    if [ -z "$PID" ]; then
      ################## no config below this line
      if test x$PHP_FCGI_CHILDREN = x; then
        PHP_FCGI_CHILDREN=5
      fi
      export PHP_FCGI_MAX_REQUESTS
      export FCGI_WEB_SERVER_ADDRS
      
      ALLOWED_ENV="$ALLOWED_ENV PHP_FCGI_MAX_REQUESTS FCGI_WEB_SERVER_ADDRS"

      # negotiate the parameters for the php-cgi spawn program
      EX="$SPAWNFCGI -f $FCGIPROGRAM -C $PHP_FCGI_CHILDREN"
      if [ -z "$FCGISOCKET" ]; then
        EX="$EX -p $FCGIPORT"
      else
        EX="$EX -s $FCGISOCKET"
      fi
      if test x$UID = x0; then
        EX="$EX -u $USERID -g $GROUPID"
      fi
      if [ ! -z "$CHROOTDIR" ]; then
        EX="$EX -c $CHROOTDIR"
      fi

      # copy the allowed environment variables
      E=
      for i in $ALLOWED_ENV; do
        E="$E $i=${!i}"
      done
      # clean environment and set up a new one
      env - $E $EX > /dev/null
      add_daemon ${SPAWN_DAEMON_NAME}
      stat_done
    fi
    ;;
   stop)
     stat_busy "Stopping ${SPAWN_DAEMON_NAME}"
     if [ ! -z "$PID" ]; then
       killall ${FCGIPROGRAM}
       if [ ! -z "$FCGISOCKET" ]; then
         rm -f ${FCGISOCKET}
       fi
       rm_daemon ${SPAWN_DAEMON_NAME}
       stat_done
     fi
     ;;
   restart)
     $0 stop
     sleep 2
     $0 start
     ;;
   *)
     echo "usage: $0 {start|stop|restart}"
esac
exit 0

  
