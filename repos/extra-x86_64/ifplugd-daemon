#!/bin/bash

. /etc/ifplugd/ifplugd.conf

args=ARGS_$1
[[ -z ${!args} ]] && args=$ARGS || args=${!args}
/usr/bin/ifplugd -i "$1" $args
