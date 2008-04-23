# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=autoconf
pkgver=2.62
pkgrel=1
pkgdesc="A GNU tool for automatically configuring source code"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnu.org/software/autoconf"
groups=('base-devel')
depends=('awk' 'm4' 'diffutils' 'bash')
options=('!makeflags')
source=(ftp://ftp.gnu.org/pub/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('6c1f3b3734999035d77da5024aab4fbd')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
