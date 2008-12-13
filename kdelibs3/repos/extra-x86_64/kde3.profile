export KDE3DIR=/opt/kde
export KDEDIRS=/usr:$KDE3DIR
export PATH=$PATH:$KDE3DIR/bin
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$KDE3DIR/lib/pkgconfig
if [ ! -z $XDG_DATA_DIRS ]; then
  export XDG_DATA_DIRS=$XDG_DATA_DIRS:$KDE3DIR/share
else
  export XDG_DATA_DIRS=$KDE3DIR/share
fi
if [ ! -z $XDG_CONFIG_DIRS ]; then
  export XDG_CONFIG_DIRS=$XDG_CONFIG_DIRS:$KDE3DIR/etc/xdg
else
  export XDG_CONFIG_DIRS=$KDE3DIR/etc/xdg
fi
unset KDE3DIR