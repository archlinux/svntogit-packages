# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=recordproto
pkgver=1.13.2
pkgrel=1
pkgdesc="X11 Record extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('0ed4706564a34fc2aff724aa16d3ff00')
sha1sums=('833ef2bc4b084281f85eeba5d4ba03441bd3a534')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
