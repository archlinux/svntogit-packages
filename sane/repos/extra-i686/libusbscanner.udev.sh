#!/bin/sh

# This file is part of sane-backends.
#
# This script changes the permissions and ownership of a USB device under
# /proc/bus/usb to grant access to this device to users in the scanner group.
#
# Ownership is set to root:scanner, permissions are set to 0660.
#
# Arguments :
# -----------
# ACTION=[add|remove]
# DEVICE=/proc/bus/usb/BBB/DDD
# TYPE=usb

# latest hotplug doesn't set DEVICE on 2.6.x kernels
if [ -z "$DEVICE" ] ; then
  IF=`echo $DEVPATH | sed 's/\(bus\/usb\/devices\/\)\(.*\)-\(.*\)/\2/'`
  DEV=$(cat /sys/${DEVPATH}/devnum)
  DEVICE=`printf '/proc/bus/usb/%.03d/%.03d' $IF $DEV`
fi

#if [ "$ACTION" = "add" -a "$SUBSYSTEM" = "usb" ]; then
  chown root:scanner "$DEVICE"
  chmod 0660 "$DEVICE"
#fi


# That's an insecure but simple alternative
# Everyone has access to the scanner

# if [ "$ACTION" = "add" -a "$TYPE" = "usb" ]; then
#  chmod 0666 "$DEVICE"
# fi

