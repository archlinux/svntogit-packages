# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libxevie
pkgver=1.0.2
pkgrel=1
pkgdesc="X11 EvIE extension library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxext')
makedepends=('pkgconfig' 'evieext')
options=('nolibtool')
source=(${url}/releases/individual/lib/libXevie-${pkgver}.tar.bz2)
md5sums=('88e9bf535364e7c821ef4014fb1ca2dd')

build() {
  cd ${startdir}/src/libXevie-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
