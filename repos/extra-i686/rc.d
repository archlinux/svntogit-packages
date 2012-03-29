#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions

[[ -f /etc/conf.d/clamav ]] && source /etc/conf.d/clamav

PID_FC=$(pidof -o %PPID /usr/bin/freshclam)
PID_CD=$(pidof -o %PPID /usr/sbin/clamd)

case "$1" in
	start)
		if [[ $START_CLAMD = yes ]]; then
			stat_busy "Starting ClamD"
			[[ -z $PID_CD ]] && /usr/sbin/clamd
			if [[ $? -gt 0 ]]; then
					stat_fail
			else
					add_daemon clamav
					stat_done
			fi
		fi
		sleep 1
		if [[ $START_FRESHCLAM = yes ]]; then
			stat_busy "Starting FreshClam"
			[[ -z $PID_FC ]] && /usr/bin/freshclam -p /run/clamav/freshclam.pid -d $FRESHCLAM_OPTS
			if [[ $? -gt 0 ]]; then
					stat_fail
			else
					add_daemon clamav
					stat_done
			fi
		fi
	;;
	stop)
		if [[ $START_CLAMD = yes ]]; then
			stat_busy "Stopping ClamD"
			[[ -n $PID_CD ]] && kill $PID_CD &> /dev/null
				if [[ $? -gt 0 ]]; then
					stat_fail
				else
					rm_daemon clamav
					stat_done
				fi
		fi

		if [[ $START_FRESHCLAM = yes ]]; then
			stat_busy "Stopping FreshClam"
			[[ -n $PID_FC ]] && kill $PID_FC &> /dev/null
			if [[ $? -gt 0 ]]; then
					stat_fail
			else
					rm_daemon clamav
					stat_done
			fi
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
