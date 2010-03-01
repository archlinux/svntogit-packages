#!/bin/sh
# ugly way to load up gateway, since
# al's net configuration doesn't associate
# gateways with specific interfaces.
/sbin/route add $gateway
