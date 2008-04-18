# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=make
pkgver=3.81
pkgrel=3
pkgdesc="GNU make utility to maintain groups of programs"
arch=(i686 x86_64)
url="http://www.gnu.org/software/make"
license=('GPL')
groups=('base-devel')
depends=('glibc' 'bash')
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('a4e9494ac6dc3f6b0c5ff75c5d52abba')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
