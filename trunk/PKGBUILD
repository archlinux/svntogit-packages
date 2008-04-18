# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libxkbfile
pkgver=1.0.4
pkgrel=1
pkgdesc="X11 keyboard file manipulation library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libx11')
makedepends=('pkgconfig')
options=('nolibtool')
source=(${url}/releases/individual/lib/${pkgname}-${pkgver}.tar.bz2)
md5sums=('12b4ceb5d42b520228b5fb40a96ae6c5')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --host=${CHOST} --build=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
