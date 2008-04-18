# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=m4
pkgver=1.4.10
pkgrel=3
pkgdesc="m4 macro processor"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnu.org/software/m4"
groups=('base-devel')
depends=('glibc' 'bash')
source=(ftp://ftp.gnu.org/gnu/m4/$pkgname-$pkgver.tar.gz)
md5sums=('4f2cdda3328ec06198578596e8b12727')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
