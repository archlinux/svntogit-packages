# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libxprintapputil
pkgver=1.0.1
pkgrel=1
pkgdesc="X11 X Print Application Utility Library"
url="http://xorg.freedesktop.org/"
depends=('libxprintutil')
makedepends=('pkgconfig')
_xorg=X11R7.0
_relname=libXprintAppUtil
source=(${url}/releases/${_xorg}/src/everything/${_relname}-${_xorg}-${pkgver}.tar.bz2)
md5sums=('6d3f5d8d1f6c2c380bfc739128f41909')

build() {
  cd ${startdir}/src/${_relname}-${_xorg}-${pkgver}
  ./configure --prefix=/usr \
              --host=${CHOST} --build=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  find ${startdir}/pkg -name '*.la' -exec rm {} \;
}

