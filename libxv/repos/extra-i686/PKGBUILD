# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libxv
pkgver=1.0.3
pkgrel=1
pkgdesc="X11 Video extension library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxext' 'videoproto')
makedepends=('pkgconfig')
options=('nolibtool')
source=(${url}/releases/individual/lib/libXv-${pkgver}.tar.bz2)
md5sums=('f1c4109fa804aeaf7188b66c5cdd9f57')

build() {
  cd ${startdir}/src/libXv-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
