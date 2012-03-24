#!/bin/bash

# source application-specific settings
[ -f /etc/conf.d/iptables ] && . /etc/conf.d/iptables

# Set defaults if settings are missing
[ -z "$IPTABLES_CONF" ] && IPTABLES_CONF=/etc/iptables/iptables.rules

. /etc/rc.conf
. /etc/rc.d/functions

case "$1" in
	start)
		if [ ! -f "$IPTABLES_CONF" ]; then
			echo "Cannot load iptables rules: $IPTABLES_CONF is missing!" >&2
			exit 1
		fi
		stat_busy "Starting IP Tables"
		if [ "$IPTABLES_FORWARD" = "1" ]; then
			echo 1 >/proc/sys/net/ipv4/ip_forward
		fi
		if ck_daemon iptables; then
			/usr/sbin/iptables-restore < $IPTABLES_CONF
			if [ $? -gt 0 ]; then
				stat_fail
			else
				add_daemon iptables
				stat_done
			fi
		else
			stat_fail
		fi
		;;
	stop)
		stat_busy "Stopping IP Tables"
		if ! ck_daemon iptables; then
			fail=0
			for table in $(cat /proc/net/ip_tables_names); do
				iptables-restore < /var/lib/iptables/empty-$table.rules
				[ $? -gt 0 ] && fail=1
			done
			if [ $fail -gt 0 ]; then
				stat_fail
			else
				rm_daemon iptables
				stat_done
			fi
		else
			stat_fail
		fi
		;;
	restart)
		$0 stop
		$0 start
		;;
	save)
		stat_busy "Saving IP Tables"
		/usr/sbin/iptables-save >$IPTABLES_CONF
		if [ $? -gt 0 ]; then
			stat_fail
		else
			stat_done
		fi
		;;
	*)
		echo "usage: $0 {start|stop|restart|save}"
esac
exit 0
