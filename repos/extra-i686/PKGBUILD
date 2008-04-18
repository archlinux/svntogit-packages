# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libxfixes
pkgver=4.0.3
pkgrel=1
pkgdesc="X11 miscellaneous 'fixes' extension library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libx11' 'fixesproto')
makedepends=('pkgconfig')
options=('nolibtool')
source=(${url}/releases/individual/lib/libXfixes-${pkgver}.tar.bz2)
md5sums=('1990d19725a3c7f32290037f02d3737f')

build() {
  cd ${startdir}/src/libXfixes-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
