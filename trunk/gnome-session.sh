#!/bin/sh
if [ -n "${DISPLAY}" ]; then
  . /etc/X11/xinit/xinitrc.d/30-dbus
fi
exec /usr/lib/gnome-session/gnome-session $@
