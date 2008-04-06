#!/bin/sh
#
# Wrapper to set environment variables then exec the real zapper.
# The reasons for this are twofold:
#	- for some reason squid doesn't preserve the original environment
#	  when you do a restart (or SIGHUP)
#	- to avoid having to hack the squid startup script (if you have
#	  a presupplied one, such as ships with some linux distributions)
#
# Install in the same directory you put the zapper (just for convenience) and
# hack the pathnames below to suit.
# Note that you can skip this script and run the zapper with no environment
# settings at all and it will work fine; the variables are all set here merely
# for completeness so that customisation is easy for you.
#	- Cameron Simpson <cs@zip.com.au> 21apr2000
#
# Script modified for Debian by Paul van Tilburg <paulvt@debian.org>.
#
# Script modified for ArchLinux by Manolis Tzanidakis <manolis@archlinux.org>.
#

# Path to the adzapper script/rediector:
zapper=/usr/bin/adzapper

# Read the configfile and set environment:
. /etc/adzapper/adzapper.conf

export ZAP_MODE ZAP_BASE ZAP_BASE_SSL ZAP_PREMATCH ZAP_POSTMATCH ZAP_MATCH
export STUBURL_AD STUBURL_ADSSL STUBURL_ADJS STUBURL_ADHTML STUBURL_ADMP3 \
	STUBURL_ADPOPUP STUBURL_ADSWF STUBURL_COUNTER STUBURL_COUNTERJS \
	STUBURL_WEBBUG STUBURL_WEBBUGJS STUBURL_PRINT

# Here, having arranged the environment, we exec the real zapper:

exec "$zapper"
