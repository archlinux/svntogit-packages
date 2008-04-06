#! /bin/bash
# Implement blacklisting for udev-loaded modules

[ $# -ne 1 ] && exit 1

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

#MODULES entries in rc.conf that begin with ! are blacklisted
for mod in ${MODULES[@]}; do
    if [ "${mod}" != "${mod#!}" ]; then
        BLACKLIST="$BLACKLIST ${mod#!}"
    fi
done


if [ "$MOD_AUTOLOAD" = "yes" -o "$MOD_AUTOLOAD" = "YES" ]; then
    if [ -n "$BLACKLIST" ]; then 
        depmods="$(/sbin/modprobe -i --show-depends $1)"
        if [ $? -ne 0 ]; then
            /usr/bin/logger -p info "cannot find module $1"
            exit 1
        fi

        #sanitize our module names
        depmods="$(echo "$depmods" | sed \
            -e "s#^insmod /lib.*/\(.*\)\.ko.*#\1#g" \
            -e 's|-|_|g')"

        for mod in $depmods; do
            if echo $BLACKLIST | /bin/grep "\<$mod\>" 2>&1 >/dev/null; then
                /usr/bin/logger -p info "udev load-modules: $1 is blacklisted"
                exit 1
            fi
        done
    fi
    /sbin/modprobe $1
else
    #/usr/bin/logger -p info \
    echo \
    "udev load-modules: autoloading is disabled, not loading $1"
fi
# vim: set et ts=4:
