# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=bigreqsproto
pkgver=1.0.2
pkgrel=1
pkgdesc="X11 Big Requests extension wire protocol"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
source=(${url}/releases/individual/proto/${pkgname}-${pkgver}.tar.bz2)
md5sums=('95c29d9d10bf2868996c0c47a3b9a8dc')
sha1sums=('8f6c112f607a137dce5d8958753c770ac3f06c14')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

