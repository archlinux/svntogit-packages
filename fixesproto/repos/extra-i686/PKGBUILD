# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=fixesproto
pkgver=4.0
pkgrel=2
pkgdesc="X11 Fixes extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=(xproto xextproto)
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=(8b298cc3424597f8138c7faf7763dce9)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

