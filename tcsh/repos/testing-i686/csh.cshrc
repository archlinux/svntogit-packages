#############################################################################
##
## Gentoo's csh.cshrc
##
## Based on the TCSH package (http://tcshrc.sourceforge.net)
## 
## .tcshrc		2Sep2001, Simos Xenitellis (simos@hellug.gr)
##
## 2003-01-13  --  Alain Penders (alain@gentoo.org)
##     Renamed to /etc/csh.cshrc, basic cleanup work.
##
## 2003-01-24  --  Alain Penders (alain@gentoo.org)
##     Improved config file handling.
##
onintr -
##


##
## Start by unsetting all our variables.  This is needed to prevent inheritance
## from the shell that started us -- e.g. when performing a 'su'.
##
unsetenv TCSH_SHELL_CTRLD
unsetenv TCSH_SHELL_SAFEHISTORY
unsetenv TCSH_SHELL_AUTOLOGOUT
unsetenv TCSH_SHELL_SAFETY
unsetenv TCSH_SHELL_DOS
unsetenv TCSH_SHELL_CDALIAS
unsetenv TCSH_SHELL_COMPLETION


##
## Get our own settings.  Make sure they exist in the user's directory.
##
if ( ! -e ~/.tcsh.config ) then
    if ( -e /etc/skel/.tcsh.config ) then
        echo ">>> Copying /etc/skel/.tcsh.config to your home directory ..."
        cp /etc/skel/.tcsh.config ~/.tcsh.config
        echo ">>> Please edit it to fine-tune the TCSH behaviour."
    else
        echo "### Missing .tcsh.config!"
    endif
endif
if ( -e ~/.tcsh.config ) then
    source ~/.tcsh.config
endif


##
## Load the environment defaults.
##
if ( -r /etc/csh.env ) then
    source /etc/csh.env
endif


##
## Make sure our path includes the basic stuff for root and normal users.
##
if ($LOGNAME == "root") then
    set -f path = ( $path /sbin )
    set -f path = ( $path /usr/sbin )
    set -f path = ( $path /usr/local/sbin )
endif
set -f path = ( $path /bin )
set -f path = ( $path /usr/bin )
set -f path = ( $path /usr/local/bin )
set -f path = ( $path /opt/bin )


##
## Load our settings -- most are for interactive shells only, but not all.
##
if ( -e /etc/profile.d/tcsh-settings ) then
    source /etc/profile.d/tcsh-settings
endif


##
## Source extensions installed by ebuilds
##
if ( -d /etc/profile.d ) then
  set _tmp=${?nonomatch}
  set nonomatch
  foreach _s ( /etc/profile.d/*.csh )
    if ( -r $_s ) then
      source $_s
    endif
  end
  if ( ! ${_tmp} ) unset nonomatch
  unset _tmp _s
endif


# Everything after this point is interactive shells only.
if ( $?prompt == 0 ) goto end


##
## Load our aliases -- for interactive shells only
##
if ( -e /etc/profile.d/tcsh-aliases ) then
    source /etc/profile.d/tcsh-aliases
endif


##
## Load our key bindings -- for interactive shells only
##
if ( -e /etc/profile.d/tcsh-bindkey ) then
    source /etc/profile.d/tcsh-bindkey
endif


##
## Load our command completions -- for interactive shells only
##
if ( $?TCSH_SHELL_COMPLETION ) then
    if ( -e /etc/profile.d/tcsh-complete ) then
        source /etc/profile.d/tcsh-complete
    endif
endif


end:
##
onintr
##

