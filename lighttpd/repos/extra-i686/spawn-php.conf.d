## ABSOLUTE path to the spawn-fcgi binary
SPAWNFCGI="/usr/bin/spawn-fcgi"

## ABSOLUTE path to the PHP binary
FCGIPROGRAM="/usr/bin/php-cgi"

## In preparation of a possible python/perl/etc compliance
SPAWN_DAEMON_NAME="spawn-php"

## bind to tcp-port on localhost
FCGIPORT="1066"

## If uncommented, socket will be used instead of port
#FCGISOCKET="/tmp/php-fastcgi.socket"

## number of PHP childs to spawn
PHP_FCGI_CHILDREN=6

## number of request server by a single php-process until is will be restarted
PHP_FCGI_MAX_REQUESTS=1000

## IP adresses where PHP should access server connections from
FCGI_WEB_SERVER_ADDRS="127.0.0.1"

# allowed environment variables sperated by spaces
ALLOWED_ENV="ORACLE_HOME PATH USER"

## if the daemon script is run as root switch to the following user
USERID=nobody
GROUPID=nobody

## cage the php process to the following dir (chrootdir)
#CHROOTDIR="/home/lighttpd/html"
