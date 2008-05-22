# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libxinerama
pkgver=1.0.3
pkgrel=1
pkgdesc="X11 Xinerama extension library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxext' 'xineramaproto')
makedepends=('pkgconfig')
options=(!libtool)
source=(${url}/releases/individual/lib/libXinerama-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/libXinerama-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

md5sums=('cd9f7c46439ac40e0517a302d2434d2c')
