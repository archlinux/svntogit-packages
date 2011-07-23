# Configuration for iptables rules
IPTABLES_CONF=/etc/iptables/iptables.rules
IP6TABLES_CONF=/etc/iptables/ip6tables.rules

# Enable IP forwarding (both IPv4 and IPv6)
# NOTE: this is not the recommended way to do this, and is supported only for
# backward compatibility. Instead, use /etc/sysctl.conf and set the following
# options:
# * net.ipv4.ip_forward=1
# * net.ipv6.conf.default.forwarding=1
# * net.ipv6.conf.all.forwarding=1
#IPTABLES_FORWARD=0
