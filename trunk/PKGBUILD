# $Id$
# Maintainer: Travis Willard <travis@archlinux.org>
pkgname=libmad
pkgver=0.15.1b
pkgrel=2
pkgdesc="A high-quality MPEG audio decoder"
arch=(i686 x86_64)
license=('GPL')
depends=('glibc')
replaces=('mad')
conflicts=('mad')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/mad/$pkgname-$pkgver.tar.gz
	libmad.patch)
url="http://www.underbit.com/products/mad/"
md5sums=('1be543bc30c56fb6bea1d7bf6a64e66c' 'fbcca0267a423bae45389666f4cb04d5')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -Np1 -i $startdir/src/libmad.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
