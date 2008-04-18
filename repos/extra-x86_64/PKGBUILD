# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=inputproto
pkgver=1.4.2.1
pkgrel=1
pkgdesc="X11 Input extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('aa948a7469168ddd9c33f11c5dff55ac')
