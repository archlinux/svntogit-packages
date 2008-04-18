# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libxrender
pkgver=0.9.4
pkgrel=1
pkgdesc="X Rendering Extension client library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libx11' 'renderproto')
makedepends=('pkgconfig')
options=('!libtool')
source=(${url}/releases/individual/lib/libXrender-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/libXrender-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('dc266e850c51368f964e0d67bf5fb5e6')
