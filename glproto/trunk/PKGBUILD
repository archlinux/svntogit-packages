# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=glproto
pkgver=1.4.9
pkgrel=1
pkgdesc="X11 OpenGL extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
source=(http://xorg.freedesktop.org/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

md5sums=('e60951628422663e60faeb400f27bac1')
