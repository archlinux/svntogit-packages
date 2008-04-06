/var/log/lighttpd/*log {
  create 644 nobody nobody
  compress
  postrotate
    /bin/kill -HUP `cat /var/run/lighttpd.pid 2>/dev/null` 2> /dev/null || true
  endscript
}

