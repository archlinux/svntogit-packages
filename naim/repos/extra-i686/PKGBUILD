# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=naim
pkgver=0.11.8.3.1
pkgrel=1
pkgdesc="An ncurses AOL Instant Messenger and IRC client."
arch=(i686 x86_64)
url="http://naim.n.ml.org"
depends=('ncurses')
source=(http://naim.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('239f8865b6f044aed26e3124a0721652')

build() {
  export MAKEFLAGS="-j1"
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
