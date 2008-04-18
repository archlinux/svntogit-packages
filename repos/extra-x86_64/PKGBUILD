# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=dmxproto
pkgver=2.2.2
pkgrel=1
pkgdesc="X11 Distributed Multihead X extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('d80acad88411e7944b9b085463d53302')
sha1sums=('80c573166ec3b9f17893e2fff84ce0107045faac')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
