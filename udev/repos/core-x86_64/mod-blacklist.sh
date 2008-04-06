#! /bin/bash
# Export a combined blacklist of all modules
# for use by the load-modules script
# 
# NOTE: we only need bash because of rc.conf, but this
# is a one-time use script, so we're good

. /etc/rc.conf

# grab modules from rc.conf
BLACKLIST="${MOD_BLACKLIST[@]}"

if [ -f /proc/cmdline ]; then 
    for cmd in $(cat /proc/cmdline); do
        case $cmd in
            *=*) eval $cmd ;;
        esac
    done
    #parse cmdline entries of the form "disablemodules=x,y,z"
    if [ -n "$disablemodules" ]; then
        BLACKLIST="$BLACKLIST $(echo $disablemodules | sed 's|,| |g')"
    fi
    if [ "$load_modules" == "off" ]; then
        MOD_AUTOLOAD="no"
    fi
fi

# blacklist framebuffer modules
DRIVER_DIR="/lib/modules/$(uname -r)/kernel/drivers/"
for x in $DRIVER_DIR/video/*/*fb*; do
	BLACKLIST="$BLACKLIST $(basename $x .ko)"
done
for x in $DRIVER_DIR/video/*fb*; do
	BLACKLIST="$BLACKLIST $(basename $x .ko)"
done

#MODULES entries in rc.conf that begin with ! are blacklisted
for mod in ${MODULES[@]}; do
    if [ "${mod}" != "${mod#!}" ]; then
        BLACKLIST="$BLACKLIST ${mod#!}"
    fi
done

echo "MOD_AUTOLOAD=\"$MOD_AUTOLOAD\""
echo "BLACKLIST=\"$BLACKLIST\""

# vim: set et ts=4:
