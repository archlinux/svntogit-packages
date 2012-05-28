/var/log/lighttpd/*log {
	missingok
	copytruncate
	notifempty
	sharedscripts
	postrotate
		/usr/bin/killall -HUP lighttpd-angel &>/dev/null || true
	endscript
}
