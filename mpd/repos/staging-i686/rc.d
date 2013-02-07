#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
	start)
		stat_busy 'Starting Music Player Daemon'
		/usr/bin/mpd /etc/mpd.conf &> /dev/null &&
		{ add_daemon mpd; stat_done; } || stat_fail
		;;
	stop)
		stat_busy 'Stopping Music Player Daemon'
		/usr/bin/mpd --kill /etc/mpd.conf &> /dev/null &&
		{ rm_daemon mpd; stat_done; } || stat_fail
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
