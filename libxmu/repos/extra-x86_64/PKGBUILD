# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libxmu
pkgver=1.0.4
pkgrel=1
pkgdesc="X11 miscellaneous micro-utility library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxext' 'libxt')
makedepends=('pkgconfig')
options=('!libtool')
source=(${url}/releases/individual/lib/libXmu-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/libXmu-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --host=${CHOST} --build=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('fb372a5f3ab42b5ba16d7af4d833a0cb')
md5sums=('fb372a5f3ab42b5ba16d7af4d833a0cb')
