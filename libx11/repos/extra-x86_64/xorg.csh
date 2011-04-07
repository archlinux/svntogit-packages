setenv XDG_DATA_HOME ${HOME}/.local/share
setenv XDG_CONFIG_HOME ${HOME}/.config
setenv XDG_CACHE_HOME ${HOME}/.cache

if (! ($?XDG_DATA_DIRS) ) then
  	setenv XDG_DATA_DIRS /usr/share/:/usr/local/share/
else
	setenv XDG_DATA_DIRS /usr/share/:/usr/local/share/:${XDG_DATA_DIRS}
endif

if (! ($?XDG_CONFIG_DIRS) ) then
	setenv XDG_CONFIG_DIRS /etc/xdg
else
	setenv XDG_CONFIG_DIRS /etc/xdg:${XDG_CONFIG_DIRS}
endif
