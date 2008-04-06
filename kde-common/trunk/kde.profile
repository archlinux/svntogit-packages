export KDEDIR=/opt/kde 
export KDEDIRS=$KDEDIR:/usr
export PATH=$PATH:$KDEDIR/bin 
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$KDEDIR/lib/pkgconfig
if [ ! -z $XDG_DATA_DIRS ]; then 
  export XDG_DATA_DIRS=$XDG_DATA_DIRS:$KDEDIR/share 
else 
  export XDG_DATA_DIRS=$KDEDIR/share 
fi 
if [ ! -z $XDG_CONFIG_DIRS ]; then 
  export XDG_CONFIG_DIRS=$XDG_CONFIG_DIRS:$KDEDIR/etc/xdg 
else 
  export XDG_CONFIG_DIRS=$KDEDIR/etc/xdg 
fi 
