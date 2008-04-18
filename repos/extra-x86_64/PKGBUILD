# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libsm
pkgver=1.0.3
pkgrel=1
pkgdesc="X11 Session Management library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libice' 'xproto')
makedepends=('pkgconfig' 'xtrans')
options=('nolibtool')
source=(${url}/releases/individual/lib/libSM-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/libSM-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('184cbf502b3cd5d7ba5f9d1290a99606')
