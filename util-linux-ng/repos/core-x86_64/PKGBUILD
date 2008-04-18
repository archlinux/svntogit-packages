# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=util-linux-ng
pkgver=2.13.0.1
pkgrel=2
pkgdesc="Miscellaneous system utilities for Linux"
arch=('i686' 'x86_64')
groups=('base')
depends=('bash' 'ncurses' 'zlib' 'e2fsprogs')
replaces=('linux32' 'util-linux')
conflicts=('linux32' 'util-linux')
provides=('linux32' 'util-linux')
license=('GPL')
source=(ftp://ftp.kernel.org/pub/linux/utils/${pkgname}/v2.13/${pkgname}-${pkgver}.tar.bz2
	cryptoloop-support.patch)
md5sums=('48bcb80babcf4d307c190871955f8025'
         '3f3c45c55ed7ec34f7ebaebd0b3e0029')

# The cryptoloop-support.patch comes from the boys at Rock Linux
#   (http://www.rocklinux.net/packages/util-linux.html)

# Newer crypt support is here:
#    http://loop-aes.sourceforge.net/updates/util-linux-${_realver}.diff.bz2

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./autogen.sh
  # cryptoloop support
  patch -Np1 -i ${startdir}/src/cryptoloop-support.patch || return 1
  sed -e 's%etc/adjtime%var/lib/hwclock/adjtime%' -i hwclock/hwclock.c 
  mkdir -p ${startdir}/pkg/var/lib/hwclock
  ./configure --enable-arch --enable-write --enable-raw --disable-wall --enable-rdev
  make HAVE_SLN=yes ADD_RAW=yes || return 1
  make HAVE_SLN=yes ADD_RAW=yes DESTDIR=${startdir}/pkg install
  rm -f ${startdir}/pkg/bin/kill
  rm -f ${startdir}/pkg/usr/share/man/man1/kill.1
  rm -f ${startdir}/pkg/usr/share/man/man5/nfs.5
}
