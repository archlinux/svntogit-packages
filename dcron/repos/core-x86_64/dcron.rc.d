#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/crond

PID=$(pidof -o %PPID /usr/sbin/crond)
case $1 in
start)
	stat_busy "Starting Cron Daemon"

	# defaults to using syslog, and sendmail-ing cron output to local user
	# to mail output to remote address instead, add "-m user@host"
	# to CROND_ARGS in /etc/conf.d/crond
	if [[ -z $PID ]] && /usr/sbin/crond $CROND_ARGS; then

		PID=$(pidof -o %PPID /usr/sbin/crond)
		echo "$PID" > /var/run/crond.pid
		add_daemon crond
		stat_done
	else
		stat_fail
		exit 1
	fi
	;;

stop)
	stat_busy "Stopping Cron Daemon"
	if [[ ! -z $PID ]]  && kill "$PID" &>/dev/null; then
		rm_daemon crond
		stat_done
	else
		stat_fail
		exit 1
	fi
	;;

restart)
	$0 stop
	$0 start
	;;

*)
	echo "Usage: $0 {start|stop|restart}" >&2
	exit 1

esac
