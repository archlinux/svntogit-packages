# Customize below to fit your system

COMPONENTS = \
	libixp \
	libixp_pthread
IGNORE = \
	libixp_task \
	libixp_rubythread

RUBYINC = -I/usr/lib/ruby/1.8/i686-linux
TASKINC = -I${HOME}/libtask

# paths
PREFIX = /usr
BIN = ${PREFIX}/bin
MAN = ${PREFIX}/share/man
ETC = ${PREFIX}/etc
LIBDIR = ${PREFIX}/lib
INCLUDE = ${PREFIX}/include

# Includes and libs
INCPATH = .:${ROOT}/include:${INCLUDE}:/usr/include
LIBS = -L/usr/lib -lc

# Flags
include ${ROOT}/mk/gcc.mk
CFLAGS = -g -Wall ${INCS} -DVERSION=\"${VERSION}\"
LDFLAGS = -g ${LIBS}

# Compiler
CC = cc -c
# Linker (Under normal circumstances, this should *not* be 'ld')
LD = cc
# Other
AR = ar crs
#AR = sh -c 'ar cr "$$@" && ranlib "$$@"'

# Solaris
#CFLAGS = -fast ${INCS} -DVERSION=\"${VERSION}\"
#LDFLAGS = ${LIBS} -R${PREFIX}/lib
#LDFLAGS += -lsocket -lnsl
#CFLAGS += -xtarget=ultra
FCALL_H_VERSION=.nounion

