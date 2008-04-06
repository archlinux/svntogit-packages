#!/bin/sh
CLASS="`ls -1r /usr/share/java/libgcj-*.jar 2> /dev/null | grep -m 1 libgcj-[[:digit:]]`"
jikes-bin -bootclasspath ${CLASS} "$@"
