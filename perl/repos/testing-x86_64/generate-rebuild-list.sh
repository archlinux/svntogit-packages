#!/bin/sh

pkgfile -r "^/usr/lib/perl5/vendor_perl/auto/.*\.so$" | sed 's#^.*/##' | sort -u
ssh soyuz.archlinux.org PATH=/usr/local/bin:\$PATH\; /home/bluewind/bin/sogrep-all libperl.so
