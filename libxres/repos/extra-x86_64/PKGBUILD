# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libxres
pkgver=1.0.3
pkgrel=1
pkgdesc="X11 Resource extension library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org"
depends=('libxext')
makedepends=('pkgconfig' 'resourceproto' 'damageproto' 'compositeproto' 'scrnsaverproto')
options=(!libtool)
source=(${url}/releases/individual/lib/libXres-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/libXres-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('de66ffb657aba64c9d6dbdeabb757f3e')
