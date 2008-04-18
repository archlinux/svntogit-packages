# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libxprintutil
pkgver=1.0.1
pkgrel=1
pkgdesc="X11 X Print Utility Library"
url="http://xorg.freedesktop.org/"
depends=('libxp' 'libxt')
makedepends=('pkgconfig')
_xorg=X11R7.0
_relname=libXprintUtil
source=(${url}/releases/${_xorg}/src/everything/${_relname}-${_xorg}-${pkgver}.tar.bz2)
md5sums=('47f1863042a53a48b40c2fb0aa55a8f7')

build() {
  cd ${startdir}/src/${_relname}-${_xorg}-${pkgver}
  ./configure --prefix=/usr \
              --host=${CHOST} --build=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  find ${startdir}/pkg -name '*.la' -exec rm {} \;
}

