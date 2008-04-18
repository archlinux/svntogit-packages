# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=less
pkgver=418
pkgrel=1
pkgdesc="A terminal based program for viewing text files"
license=('GPL3')
arch=('i686' 'x86_64')
url="http://www.greenwoodsoftware.com/less"
groups=('base')
depends=('ncurses' 'file')
source=(http://www.greenwoodsoftware.com/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b5864d76c54ddf4627fd57ab333c88b4')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
  cd $startdir/pkg/usr/bin/
  mkdir -p ../../bin
  mv $pkgname ../../bin/
}
