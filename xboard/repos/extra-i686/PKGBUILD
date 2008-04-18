# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=xboard
pkgver=4.2.7
pkgrel=2
pkgdesc="XBoard is a graphical user interfaces for chess"
depends=('libxaw')
source=(ftp://gatekeeper.dec.com/pub/GNU/xboard/$pkgname-$pkgver.tar.gz)
md5sums=('b70ad8ff7569975302c5fb402d5eea32')
url="http://www.tim-mann.org/chess.html"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
