#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

PROGNAME=smtpprox
case "$1" in
	start)
		stat_busy "Starting Smtpprox"
		su nobody -c "/opt/smtpprox/$PROGNAME --listen=127.0.0.1:10025 --talk=127.0.0.1:10026"
		if [ $? -gt 0 ]; then
			stat_fail
		else
			pidof -o %PPID -x smtpprox >/var/run/$PROGNAME.pid
			add_daemon smtpprox
			stat_done
		fi
	;;
	stop)
		stat_busy "Stopping Smtpprox"
		if [ ! -e /var/run/$PROGNAME.pid ] ; then
			echo "$PROGNAME not running"
		else
			kill `cat /var/run/$PROGNAME.pid`
			if [ $? -gt 0 ]; then
				stat_fail
			else
				rm_daemon smtpprox
				stat_done
			fi
		fi
	;;
	restart)
		$0 stop
		sleep 2
		$0 start
	;;
esac
