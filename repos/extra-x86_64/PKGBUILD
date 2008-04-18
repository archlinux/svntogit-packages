# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libxss
pkgver=1.1.1
pkgrel=1
pkgdesc="X11 Screen Saver extension library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxext' 'scrnsaverproto')
makedepends=('pkgconfig')
options=('nolibtool')
source=(${url}/releases/individual/lib/libXScrnSaver-${pkgver}.tar.bz2)
md5sums=('264f63058ab690142ded20585f8ac642')

build() {
  cd ${startdir}/src/libXScrnSaver-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
