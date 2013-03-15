#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

name=postfix

case "$1" in
start)
	stat_busy "Starting $name daemon"
	/usr/sbin/postfix start &>/dev/null \
	&& { add_daemon $name; stat_done; } \
	|| { stat_fail; exit 1; }
	;;
stop)
	stat_busy "Stopping $name daemon"
	/usr/sbin/postfix stop &>/dev/null \
	&& { rm_daemon $name; stat_done; } \
	|| { stat_fail; exit 1; }
	;;
reload)
	stat_busy "Reloading $name daemon"
	/usr/sbin/postfix reload &>/dev/null \
	&& { stat_done; } \
	|| { stat_fail; exit 1; }
	;;
restart)
	$0 stop
	sleep 1
	$0 start
	;;
*)
	echo "usage: $0 {start|stop|restart|reload}"
	;;
esac
exit 0
