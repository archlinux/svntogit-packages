# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=diffutils
pkgver=2.8.1
pkgrel=5
pkgdesc="Utility programs used for creating patch files"
arch=(i686 x86_64)
license=('GPL')
groups=('base-devel')
url="http://www.gnu.org/software/diffutils"
depends=('glibc')
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('71f9c5ae19b60608f6c7f162da86a428')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
