# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libfs
pkgver=1.0.0
pkgrel=1
pkgdesc="X11 Font Services Library"
url="http://xorg.freedesktop.org/"
depends=('glibc' 'xproto' 'fontsproto')
makedepends=('pkgconfig' 'xtrans')
_xorg=X11R7.0-RC4
_relname=libFS
source=(${url}/releases/${_xorg}/everything/${_relname}-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/${_relname}-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  find ${startdir}/pkg -name '*.la' -exec rm {} \;
}

