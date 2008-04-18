# $Id$
# Maintainer: eric <eric@archlinux.org>

pkgname=hexcurse
pkgver=1.55
pkgrel=1
pkgdesc="Versatile ncurses-based hex editor."
url="http://jewfish.net/description.php?title=HexCurse"
depends=('ncurses')
source=(http://jewfish.net/downloads/$pkgname-$pkgver.tar.gz)
md5sums=('c9f9485490300b5111aa429eabfef789')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
