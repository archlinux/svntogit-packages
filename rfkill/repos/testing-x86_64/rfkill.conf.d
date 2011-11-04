#
# /etc/conf.d/rfkill
# Configuration for the rfkill startup script
#

# List of devices to block on startup (space-separated)
RFKILL_BLOCK=""

# List of devices to unblock on startup (space-separated)
RFKILL_UNBLOCK="all"

# Supported device names are: all, wifi, bluetooth, umb, wimax, wwan, gps and specific device names like phy0, hci0, ...
# See "rfkill list" for available devices
# Examples:
#
# Block all bluetooth devices:
# RFKILL_BLOCK="bluetooth"
#
# Unblock the phy0 wifi device and all wwan devices:
# RFKILL_UNBLOCK="phy0 wwan"
