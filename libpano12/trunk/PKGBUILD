# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=libpano12
pkgver=2.8.6
pkgrel=1
pkgdesc="basic library to calculate panoramical pictures - core functions of the panotools"
        url="http://panotools.sourceforge.net/"
arch=(i686 x86_64)
license=('GPL')
depends=('libpng' 'libtiff')
makedepends=('j2sdk')
options=('!libtool')
source=(http://dl.sourceforge.net/sourceforge/panotools/$pkgname-$pkgver.tar.gz)
md5sums=('d4eae64c292bff3001ef3eef0fc9cb94')

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -i 's:\(^.*MAX_FISHEYE_FOV.*\)160.*$:\1720.0:' filter.h
  ./configure --prefix=/usr --with-java=/opt/java
  make || return 1
  make DESTDIR=$startdir/pkg install
}
