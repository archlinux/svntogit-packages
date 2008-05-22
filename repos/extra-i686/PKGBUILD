# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xf86driproto
pkgver=2.0.4
pkgrel=1
pkgdesc="X11 DRI extension wire protocol"
url="http://xorg.freedesktop.org/"
arch=(i686 x86_64)
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

md5sums=('01470d088da3a8a3deefa8e1f45d69cb')
