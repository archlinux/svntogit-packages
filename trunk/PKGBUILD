# $Id$
# Maintainer: Dan McGee <dan@archlinux.org>

pkgname=valgrind
pkgver=3.3.0
pkgrel=1
pkgdesc="A tool to help find memory-management problems in programs"
arch=(i686 x86_64)
license=('GPL')
url="http://valgrind.org/"
depends=('glibc')
source=(http://valgrind.org/downloads/${pkgname}-${pkgver}.tar.bz2)
options=(!emptydirs)
md5sums=('e5fc39755a714f36b7e5014c1c6d4748')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  # make sure our CFLAGS are respected
  sed -i -e 's:^CFLAGS="-Wno-long-long":CFLAGS="$CFLAGS -Wno-long-long":' configure.in

  if [ "${CARCH}" = "x86_64" ]; then
    ./configure --prefix=/usr --enable-only64bit
  else
    ./configure --prefix=/usr
  fi
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
