# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libxxf86dga
pkgver=1.0.2
pkgrel=1
pkgdesc="X11 Direct Graphics Access extension library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxext' 'xf86dgaproto>=2.0.3')
makedepends=('pkgconfig')
options=('!libtool')
source=(${url}/releases/individual/lib/libXxf86dga-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/libXxf86dga-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

md5sums=('6f5f621804ee652b6cc6f2025c517c78')
