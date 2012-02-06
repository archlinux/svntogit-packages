/var/log/lighttpd/*log {
	missingok
	copytruncate
	notifempty
	sharedscripts
	postrotate
	/etc/rc.d/lighttpd reload >/dev/null || true
	endscript
}
