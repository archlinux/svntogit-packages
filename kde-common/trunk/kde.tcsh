setenv KDEDIR /opt/kde
setenv KDEDIRS /usr:$KDEDIR
setenv PATH $KDEDIR/bin:$PATH
setenv PKG_CONFIG_PATH $KDEDIR/lib/pkgconfig:$PKG_CONFIG_PATH
if ( ! $?XDG_DATA_DIRS ) then
  setenv XDG_DATA_DIRS $KDEDIR/share
else
  setenv XDG_DATA_DIRS $KDEDIR/share:$XDG_DATA_DIRS
endif
if ( ! $?XDG_CONFIG_DIRS ) then
  setenv XDG_CONFIG_DIRS $KDEDIR/etc/xdg
else
  setenv XDG_CONFIG_DIRS $KDEDIR/etc/xdg:$XDG_CONFIG_DIRS
endif
