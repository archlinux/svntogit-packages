#!/bin/sh

if [ "$1" == "resume" ] || [ "$1" == "thaw" ]; then
  /usr/sbin/storage-fixup
fi

