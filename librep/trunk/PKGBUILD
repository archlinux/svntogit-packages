# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=librep
pkgver=0.17
pkgrel=1
pkgdesc="A Lisp system for UNIX"
depends=('gmp' 'gdbm' 'bash')
source=(http://dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
	librep.patch)
url="http://sourceforge.net/projects/librep"
md5sums=('ad4ad851ff9f82a5d61024cd96bc2998' '0aea66ba85b3b079db6ad12cf70f7d89')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i ../librep.patch
  ./configure --prefix=/usr --libexecdir=/usr/lib/$pkgname
  make || return 1
  make DESTDIR=$startdir/pkg install
}
