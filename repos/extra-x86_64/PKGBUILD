# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=videoproto
pkgver=2.2.2
pkgrel=1
pkgdesc="X11 Video extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('44292d74a9a3c94b1ecb9d77a0da83e8')
sha1sums=('904eb59ae2451dea52370d927bf490b696f9033c')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
