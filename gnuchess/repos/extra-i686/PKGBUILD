# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=gnuchess
pkgver=5.07
pkgrel=2
pkgdesc="Lets most modern computers play a full game of chess"
depends=('glibc' 'ncurses' 'readline')
source=(ftp://ftp.gnu.org/pub/gnu/chess/$pkgname-$pkgver.tar.gz)
md5sums=('259da00aa559e5624c65279484fccaf7')
url="http://www.gnu.org/software/chess/chess.html"
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
