# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=printproto
pkgver=1.0.3
pkgrel=1
pkgdesc="X11 print extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('0f4e7982c6d4ec3b2cf38502dd1293a3')
sha1sums=('c9b62c20ed50ce44c4835d5fd2d1bb52af66f75f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
