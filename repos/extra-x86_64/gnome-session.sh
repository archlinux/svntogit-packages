#!/bin/sh
. /etc/X11/xinit/xinitrc.d/30-dbus
exec /usr/lib/gnome-session/gnome-session
