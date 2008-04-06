DAEMON_NAME="lighttpd"
DAEMON_CONF="/etc/lighttpd/lighttpd.conf"
DAEMON_PATH="/usr/sbin/lighttpd"
 # this greps the error-log which is set in the lighttpd.conf
 # override it by setting it to a fix path
DAEMON_ERRLOG=`sed -n \
                -e '/server\.errorlog/p' ${DAEMON_CONF} \
                | sed -e '/^ *#.*/d' \
                | sed -e 's/^.*"\(.*\)".*$/\1/'`
# DAEMON_ERRLOG="/var/log/lighttpd/error.log"
