#! /bin/sh
# Implement blacklisting for udev-loaded modules
#   Includes module checking
# - Aaron Griffin & Tobias Powalowski for Archlinux
[ $# -ne 1 ] && exit 1

if [ -f /proc/cmdline ]; then 
	for cmd in $(cat /proc/cmdline); do
    		case $cmd in
        		*=*) eval $cmd ;;
    		esac
	done
fi

# get the real names from modaliases
i="$(/bin/moddeps $1)"
# add disablemodules= from commandline to blacklist
k="$(/bin/replace "${disablemodules}" ',')"
j="$(/bin/replace "${k}" '-' '_')"

if [ "${j}" != "" ] ; then
	for n in ${i}; do
        	for o in ${j}; do
			if [ "$n" = "$o" ]; then
                		exit 1
            		fi
		done
	done
fi
/sbin/modprobe $1

# vim: set et ts=4:
