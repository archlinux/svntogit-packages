%s:/srv/www/htdocs/:/home/lighttpd/html/:
%s:/srv/www/vhosts/:/home/lighttpd/vhosts/:
%s:#server\.pid\-file:server.pid-file:
%s:/var/cache/lighttpd/compress/:/home/lighttpd/cache/:
%s:^#server\.username.*$:server.username            = "nobody":
%s:^#server\.groupname.*$:server.groupname            = "nobody":
%s:/usr/local/bin/php-cgi:/usr/bin/php-cgi:
%s:\(vhost\.server-root.*=\).*$:\1 "/home/lighttpd/vhosts/":
/SSL engine/,/pem/d
i
#### SSL engine
#$SERVER["socket"] == "0.0.0.0:443" {
#  ssl.engine                  = "enable"
#  ssl.pemfile                 = "/home/lighttpd/ssl/server.pem"
#  server.errorlog             = "/var/log/lighttpd/error-ssl.log"
#  accesslog.filename          = "/var/log/lighttpd/access-ssl.log"
#  server.document-root        = "/home/lighttpd/html-ssl"
#}
.
1
/server.username/,/server.groupname/d
i
##  !!!! IF YOU CHANGE THE UID OR GROUPID apply the changes to /etc/logrotate.conf as well !!!
server.username             = "nobody"

## change uid to <uid> (default: don't care)
server.groupname            = "nobody"
.
w
q
