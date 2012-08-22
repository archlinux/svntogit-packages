#
# Command line options to varnishd
#

VARNISH_CFG="/etc/varnish/default.vcl"

VARNISHD_OPTS="-a 0.0.0.0:80 \
               -f $VARNISH_CFG \
               -T localhost:6082 \
               -s malloc,64M
               -u nobody -g nobody"
