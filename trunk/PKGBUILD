# $Id$
# Maintainer: eric <eric@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=tdb
pkgver=1.0.6
pkgrel=3
pkgdesc="A Trivial Database similar to GDBM but allows simultaneous commits"
depends=('glibc')
source=(http://puzzle.dl.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz gcc3.patch)
url="http://sourceforge.net/projects/tdb/"
md5sums=('6b643fdeb48304010dcd5f675e458b58' '2057e2ee24effd3318a85cbe66c216e2')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p1 -i $startdir/src/gcc3.patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
