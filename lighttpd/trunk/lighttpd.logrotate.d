/var/log/lighttpd/*log {
	missingok
	copytruncate
	postrotate
	/etc/rc.d/lighttpd reload >/dev/null || true
	endscript
}
