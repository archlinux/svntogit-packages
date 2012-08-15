#!/bin/bash

. /etc/rc.conf
. /etc/rc.d/functions
. /etc/conf.d/varnish

pidfile=/run/varnish.pid
if [[ -r $pidfile ]]; then
  read -r PID < "$pidfile"
    if [[ ! -d /proc/$PID ]]; then
      # stale pidfile
      unset PID
    rm -f "$pidfile"
  fi
fi

case $1 in
  start)
    stat_busy "Starting Varnish Reverse Proxy"
    if /usr/sbin/varnishd $VARNISHD_OPTS -P "$pidfile"; then
      add_daemon varnish
      stat_done
    else
      stat_fail
      exit 1
    fi
    ;;
  stop)
    stat_busy "Stopping Varnish Reverse Proxy"
    if [[ $PID ]] && kill $PID &>/dev/null; then
      rm_daemon varnish
      stat_done
    else
      stat_fail
      exit 1
    fi
    ;;
  restart)
    $0 stop
    sleep 1
    $0 start
    ;;
  reload)
    status "Recompiling and Reloading VCL" varnish-vcl-reload $VARNISH_CFG
    ;;
  *)
    echo "usage: $0 {start|stop|restart|reload}"
  ;;
esac
