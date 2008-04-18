# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libxrandr
pkgver=1.2.2
pkgrel=1
pkgdesc="X11 RandR extension library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxext' 'libxrender' 'randrproto>=1.2.1')
makedepends=('pkgconfig')
options=('!libtool')
source=(${url}/releases/individual/lib/libXrandr-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/libXrandr-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('1b244b5d19f0ccab01d7083436cd3558')
