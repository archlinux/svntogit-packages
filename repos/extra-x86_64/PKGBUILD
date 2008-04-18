# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=xcursor-themes
pkgver=1.0.1
pkgrel=1
pkgdesc="X.org Cursor themes"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
makedepends=('pkgconfig' 'xorg-apps')
source=(${url}/releases/individual/data/${pkgname}-${pkgver}.tar.bz2)
md5sums=('014bad415e64c49994679cdb71a97e37')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

