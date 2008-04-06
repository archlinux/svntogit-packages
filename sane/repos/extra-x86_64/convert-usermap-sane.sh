#!/bin/bash
#
# Converts libsane.usermap to an udev rules file
#

if [ ! -e sane.rules ]; then
    cat > sane.rules <<EOF
# This file is part of the SANE distribution
#
# udev rules file for supported scanners
#
#
# For now, only USB scanners are listed/supported by this set of rules;
# feel free to add support for other busses.
#
# To add an USB scanner, add a rule to the list below between the SUBSYSTEM...
# and LABEL... lines.
#
# To run a script when your scanner is plugged in, add RUN="/path/to/script"
# to the appropriate rule.
#

SUBSYSTEM!="usb_device", ACTION!="add", GOTO="libsane_rules_end"

EOF
fi

cat "$1" | { while read map; do
    if $(echo "$map" | grep -q ^# > /dev/null); then
	echo $map >> sane.rules
    else
	set $map

	vid=$(echo $3 | cut -b3-)
	pid=$(echo $4 | cut -b3-)

	echo -e "SYSFS{idVendor}==\"$vid\", SYSFS{idProduct}==\"$pid\", GROUP=\"scanner\"" >> sane.rules
    fi
done }

echo >> sane.rules
echo "LABEL=\"libsane_rules_end\"" >> sane.rules

exit 0
