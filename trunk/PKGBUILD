# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libxcomposite
pkgver=0.4.0
pkgrel=1
pkgdesc="X11 Composite extension library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxfixes' 'libxext' 'compositeproto')
makedepends=('pkgconfig')
options=(!libtool)
source=(${url}/releases/individual/lib/libXcomposite-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/libXcomposite-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

md5sums=('7e95395dea89be21bae929b9b7f16641')
