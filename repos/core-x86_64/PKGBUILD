# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=patch
pkgver=2.5.4
pkgrel=4
pkgdesc="A utility to apply patch files to original sources"
arch=(i686 x86_64)
url="http://www.gnu.org/software/patch/patch.html"
license=('GPL')
groups=('base-devel')
depends=('glibc' 'ed')
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('ee5ae84d115f051d87fcaaef3b4ae782')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
