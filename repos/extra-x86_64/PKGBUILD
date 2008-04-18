# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Sarah Hay <sarah@archlinux.org>

pkgname=xvidcore
pkgver=1.1.3
pkgrel=1
pkgdesc="XviD is an open source MPEG-4 video codec"
arch=(i686 x86_64)
license=('GPL')
url="http://www.xvid.org/"
depends=('glibc')
makedepends=('nasm')
source=(http://downloads.xvid.org/downloads/${pkgname}-${pkgver}.tar.bz2)
md5sums=('29c60d4d991ac18f687a8fd13cfe64b7')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}/build/generic
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install

  #Fix dynamic libraries
  cd ${startdir}/pkg/usr/lib
  mylib=$(basename libxvidcore.so.*)
  ln -sf ${mylib} libxvidcore.so.4
  ln -sf ${mylib} libxvidcore.so
}
