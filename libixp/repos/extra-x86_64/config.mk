# Customized for Arch Linux <http://archlinux.org/>
# libixp version
VERSION = 0.2

# Customize below to fit your system

# paths
PREFIX = /usr
MANPREFIX = ${PREFIX}/man

# includes and libs
INCS = -I. -I/usr/include
LIBS = -L/usr/lib -lc -L.

# flags
CFLAGS = -Os ${INCS} -DVERSION=\"${VERSION}\"
LDFLAGS = ${LIBS}
#CFLAGS = -g -Wall -O2 ${INCS} -DVERSION=\"${VERSION}\"
#LDFLAGS = -g ${LIBS}

# Solaris
#CFLAGS = -fast ${INCS} -DVERSION=\"${VERSION}\"
#LDFLAGS = ${LIBS}
#LIBS += -lsocket -lnsl
#CFLAGS += -xtarget=ultra

# compiler and linker
AR = ar cr
CC = cc
LD = ${CC}
RANLIB = ranlib
