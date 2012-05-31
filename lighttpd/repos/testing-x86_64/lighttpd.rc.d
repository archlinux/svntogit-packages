#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions


pid_file='/run/lighttpd/lighttpd-angel.pid'

get_pid() {
	if [ -r "${pid_file}" ]; then
		cat "${pid_file}"
	else
		pgrep -f /usr/sbin/lighttpd-angel
	fi
}

test_config() {
	stat_busy 'Checking configuration'
	if [ $(id -u) -ne 0 ]; then
		stat_append '(This script must be run as root)'
		stat_die
	fi

	if [ ! -r /etc/lighttpd/lighttpd.conf ]; then
		stat_append '(/etc/lighttpd/lighttpd.conf not found)'
		stat_die
	fi

	/usr/sbin/lighttpd -t -f /etc/lighttpd/lighttpd.conf >/dev/null 2>&1
	if [ $? -gt 0 ]; then
		stat_append '(error in /etc/lighttpd/lighttpd.conf)'
		stat_die
	fi

	stat_done
}

start() {
	stat_busy 'Starting lighttpd'

	local PID=$(get_pid)
	if [ -z "$PID" ]; then
		nohup /usr/sbin/lighttpd-angel -D -f /etc/lighttpd/lighttpd.conf >>/var/log/lighttpd/lighttpd-angel.log 2>&1 &
		if [ $? -gt 0 ]; then
			stat_die
		else
			echo $! > "${pid_file}"
			add_daemon lighttpd
			stat_done
		fi
	else
		stat_die
	fi
}

stop() {
	stat_busy 'Stopping lighttpd'
	local PID=$(get_pid)
	[ -n "$PID" ] && kill $PID &> /dev/null
	if [ $? -gt 0 ]; then
		stat_fail
	else
		[ -f "${pid_file}" ] && rm -f "${pid_file}"
		rm_daemon lighttpd
		stat_done
	fi
}

gracefull-stop() {
	stat_busy 'Stopping lighttpd gracefully'
	local PID=$(get_pid)
	[ -n "$PID" ] && kill -INT $PID &> /dev/null
	if [ $? -gt 0 ]; then
		stat_fail
	else
		[ -f "${pid_file}" ] && rm -f "${pid_file}"
		rm_daemon lighttpd
		stat_done
	fi
}

reload() {
	stat_busy 'Reloading lighttpd'
	local PID=$(get_pid)
	[ -n "$PID" ] && kill -HUP $PID &> /dev/null
	if [ $? -gt 0 ]; then
		stat_die
	else
		stat_done
	fi
}


case "$1" in
	start)
		test_config
		start
		;;
	stop)
		test_config
		stop
		;;
	gracefull-stop)
		test_config
		stop
		;;
	reload)
		test_config
		reload
		;;
	restart)
		test_config
		stop
		while [ -n "$(get_pid)" ]; do
			sleep 1
		done
		start
		;;
	status)
		stat_busy 'Checking lighttpd status'
		ck_status lighttpd
		;;
	*)
	echo "usage: $0 {start|stop|gracefull-stop|reload|restart|status}"
esac

exit 0
