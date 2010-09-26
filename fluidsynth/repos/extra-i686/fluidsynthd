#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

[ -f /etc/conf.d/fluidsynth ] && . /etc/conf.d/fluidsynth

PID=`pidof -o %PPID /usr/bin/fluidsynth`
case "$1" in
   start)
     stat_busy "Starting Fluidsynth soundfont synthesizer"
     [ -z "$PID" ] && /usr/bin/fluidsynth -is $FSYNTH_OPTS $FSYNTH_SOUNDFONT > /dev/null 2>&1 &
     if [ $? -gt 0 ]; then
       stat_fail
     else
       echo $PID > /var/run/fluidsynth.pid
       add_daemon fluidsynth
       stat_done
     fi
     ;;
   stop)
     stat_busy "Stopping Fluidsynth soundfont synthesizer"
     [ ! -z "$PID" ]  && kill $PID &> /dev/null 2>&1
     if [ $? -gt 0 ]; then
       stat_fail
     else
       rm /var/run/fluidsynth.pid
       rm_daemon fluidsynth
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
