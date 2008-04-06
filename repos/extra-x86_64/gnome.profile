export GNOMEDIR=/opt/gnome
export GNOME2_PATH=/opt/gnome
export PATH=$PATH:$GNOMEDIR/bin
export MANPATH=$MANPATH:$GNOMEDIR/man
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$GNOMEDIR/lib/pkgconfig
export LIBGLADE_MODULE_PATH=$LIBGLADE_MODULE_PATH:$GNOMEDIR/lib/libglade/2.0
export ACLOCAL_FLAGS="$ACLOCAL_FLAGS -I $GNOME2_PATH/share/aclocal"

if [ ! -z $XDG_DATA_DIRS ]; then
  export XDG_DATA_DIRS=$XDG_DATA_DIRS:$GNOMEDIR/share
else
  export XDG_DATA_DIRS=$GNOMEDIR/share
fi
if [ ! -z $XDG_CONFIG_DIRS ]; then
  export XDG_CONFIG_DIRS=$XDG_CONFIG_DIRS:$GNOMEDIR/etc/xdg
else
  export XDG_CONFIG_DIRS=$GNOMEDIR/etc/xdg
fi
