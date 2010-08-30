#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions


get_pid_file() {
	/usr/sbin/lighttpd -p -f /etc/lighttpd/lighttpd.conf 2>/dev/null | grep server.pid-file | cut -d= -f2
}

get_pid() {
	local pid_file=$(get_pid_file)
	local pid=$(pidof -o %PPID lighttpd-angel)
	# only needed when updating from 1.4.26
	# TODO: remove in future versions
	local old_pid=$(pidof -o %PPID lighttpd)
	if [ -r "${pid_file}" ]; then
		cat "${pid_file}"
	elif [ -n "${pid}" ]; then
		echo "${pid}"
	elif [ -n "${old_pid}" ]; then
		echo "${old_pid}"
	else
		echo ''
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

	local d
	for d in /var/{run,log,cache}/lighttpd; do
		if [ ! -d $d ]; then
			stat_append "(directory $d not found)"
			stat_die
		fi
	done

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
		stat_die
	else
		local pid_file=$(get_pid_file)
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
	reload)
		test_config
		reload
		;;
	restart)
		test_config
		stop
		start
		;;
	status)
		stat_busy 'Checking lighttpd status'
		ck_status lighttpd
		;;
	*)
	echo "usage: $0 {start|stop|reload|restart|status}"
esac

exit 0
