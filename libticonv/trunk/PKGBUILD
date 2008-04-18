# $Id$
# Maintainer: simo <simo@archlinux.org>
pkgname=libticonv
pkgver=1.1.0
pkgrel=1
pkgdesc="TI character set conversion library"
arch=(i686 x86_64)
url="http://tilp.info/"
license="GPL"
depends=('glib2')
options=('FORCE' 'NOLIBTOOL')
source=(http://www.archlinux.org/~simo/tilp/tilibs2/libticonv-$pkgver.tar.gz)
md5sums=('35222114f938c8d5143d12d25742881d')

build() {
  cd $startdir/src/libticonv-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
