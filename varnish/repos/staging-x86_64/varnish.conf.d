#
# Command line options to varnishd
#

VARNISHD_OPTS="-a 0.0.0.0:80 \
               -b localhost:8080 \
               -T localhost:6082 \
               -s malloc,64M
               -u nobody -g nobody"

VARNISH_CFG="/etc/varnish/default.vcl"
