/var/log/lighttpd/*log {
	postrotate
	/etc/rc.d/lighttpd reload >/dev/null || true
	endscript
}
