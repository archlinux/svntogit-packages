/var/log/lighttpd/*log {
	missingok
	postrotate
	/etc/rc.d/lighttpd reload >/dev/null || true
	endscript
}
