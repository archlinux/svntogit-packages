# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=automake
pkgver=1.10.1
pkgrel=2
pkgdesc="A GNU tool for automatically creating Makefiles"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnu.org/software/automake"
groups=('base-devel')
depends=('perl' 'bash')
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('a0acfd1b167ba55a256f0c1af2983975')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
