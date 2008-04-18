# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=randrproto
pkgver=1.2.1
pkgrel=1
pkgdesc="X11 RandR extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('e2e45564f8ce22e00e1360e79c8ccdeb')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
