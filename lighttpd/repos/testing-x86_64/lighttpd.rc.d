#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions


get_pid_file() {
	/usr/sbin/lighttpd -p -f /etc/lighttpd/lighttpd.conf 2>/dev/null | grep server.pid-file | cut -d= -f2
}

get_pid() {
	local pid_file=$(get_pid_file)
	local pid=$(pidof -o %PPID lighttpd-angel)
	if [ -r "${pid_file}" ]; then
		cat "${pid_file}"
	elif [ -n "${pid}" ]; then
		echo "${pid}"
	else
		echo ''
	fi
}

test_config() {
	/usr/sbin/lighttpd -t -f /etc/lighttpd/lighttpd.conf >/dev/null 2>&1
	if [ $? -gt 0 ]; then
		stat_append ' (error in lighttpd.conf)'
		stat_fail
		exit 1
	fi
}

start() {
	stat_busy 'Starting lighttpd'
	test_config

	local PID=$(get_pid)
	if [ -z "$PID" ]; then
		nohup /usr/sbin/lighttpd-angel -D -f /etc/lighttpd/lighttpd.conf >>/var/log/lighttpd/lighttpd-angel.log 2>&1 &
		if [ $? -gt 0 ]; then
			stat_fail
			exit 1
		else
			add_daemon lighttpd
			stat_done
		fi
	else
		stat_fail
		exit 1
	fi
}

stop() {
	stat_busy 'Stopping lighttpd'
	local PID=$(get_pid)
	[ -n "$PID" ] && kill $PID &> /dev/null
	if [ $? -gt 0 ]; then
		stat_fail
		exit 1
	else
		local pid_file=$(get_pid_file)
		[ -f "${pid_file}" ] && rm -f "${pid_file}"
		rm_daemon lighttpd
		stat_done
	fi
}

reload() {
	stat_busy 'Reloading lighttpd'
	test_config
	local PID=$(get_pid)
	[ -n "$PID" ] && kill -HUP $PID &> /dev/null
	if [ $? -gt 0 ]; then
		stat_fail
		exit 1
	else
		stat_done
	fi
}


case "$1" in
	start)
		start
		;;
	stop)
		stop
		;;
	reload)
		reload
		;;
	restart)
		stat_busy 'Checking lighttpd.conf'
		test_config
		stat_done
		stop
		start
		;;
	status)
		stat_busy 'Checking lighttpd status';
		ck_status lighttpd
		;;
	*)
	echo "usage: $0 {start|stop|reload|restart|status}"
esac

exit 0
