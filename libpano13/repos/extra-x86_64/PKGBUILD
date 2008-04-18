# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

pkgname=libpano13
pkgver=2.9.12
pkgrel=1
pkgdesc="basic library to calculate panoramical pictures - core functions of the panotools"
url="http://panotools.sourceforge.net/"
arch=(i686 x86_64)
license=('GPL2')
depends=('libpng' 'libtiff')
makedepends=('j2sdk')
options=('!libtool')
source=(http://dl.sourceforge.net/sourceforge/panotools/$pkgname-$pkgver.tar.gz)
md5sums=('3ca4f7bfe5a7b0acd86901d502dee8ca')

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -i 's:\(^.*MAX_FISHEYE_FOV.*\)160.*$:\1720.0:' filter.h || return 1
  ./configure --prefix=/usr --with-java=/opt/java
  make || return 1
  make DESTDIR=$startdir/pkg install
}
