# $Id$
# Maintainer: Jeff Mickey <jeff@archlinux.org>

pkgname=yodl
pkgver=2.04
pkgrel=1
pkgdesc="Implements a pre-document language and tools to process it."
url="http://yodl.sourceforge.net"
license="AFL"
depends=('glibc')
makedepends=('tetex' 'ghostscript')
source=(http://dl.sourceforge.net/$pkgname/${pkgname}_$pkgver.orig.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./build package
  ./build install $startdir/pkg/usr
}
md5sums=('72df93d3ded8a8d8ebfef462b393baa3')
