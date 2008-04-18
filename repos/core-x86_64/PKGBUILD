# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=which
pkgver=2.19
pkgrel=2
pkgdesc="A utility to show the full path of commands"
arch=(i686 x86_64)
url="http://www.xs4all.nl/~carlo17/which"
license=('GPL3')
groups=('base')
depends=('glibc')
source=(http://www.xs4all.nl/~carlo17/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('bbd094cec2444cd78befbc0cf09deea4')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
