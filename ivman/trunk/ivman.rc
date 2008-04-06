#!/bin/bash

# general config
. /etc/rc.conf
. /etc/rc.d/functions

PID=`pidof -o %PPID /usr/bin/ivman`
case "$1" in
    start)
        stat_busy "Starting ivman Device Manager"
        if [ -z "$PID" ]; then
            if [ ! -f /etc/ivman/IvmConfigBase.xml ]; then
                echo "ERROR: Make sure '/etc/ivman/IvmConfigBase.xml' exists"
                stat_fail
                exit 1
            fi
            /usr/bin/ivman > /dev/null
        fi
        if [ ! -f /var/run/daemons/hal ]; then
             stat_fail
             echo "ERROR: 'hal' is not running"
             if [ ! -f /var/run/daemons/dbus ]; then
                echo "NOTE: 'hal' needs 'dbus' to be running - you need to start both!"
             fi
             exit 1
        fi
        if [ ! -z "$PID" -o $? -gt 0 ]; then
            stat_fail
        else
            add_daemon ivman
            stat_done
        fi
        ;;
    stop)
        stat_busy "Stopping ivman Device Manager"
            [ ! -z "$PID" ] && kill $PID &> /dev/null
        if [ $? -gt 0 ]; then
            stat_fail
        else
            rm_daemon ivman
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
        ;;
esac
exit 0

