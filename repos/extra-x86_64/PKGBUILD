# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libxvmc
pkgver=1.0.4
pkgrel=1
pkgdesc="X11 Video Motion Compensation extension library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxv>=1.0.3')
makedepends=('pkgconfig')
options=('nolibtool')
source=(${url}/releases/individual/lib/libXvMC-${pkgver}.tar.bz2)
md5sums=('b54600573daf9d1a29b952e8d35b389e')

build() {
  cd ${startdir}/src/libXvMC-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

