# $Id$
# Maintainer: judd <jvinet@zeroflux.org>

pkgname=alsa-lib
pkgver=1.0.16
pkgrel=1
pkgdesc="An alternative implementation of Linux sound support"
arch=(i686 x86_64)
url="http://www.alsa-project.org"
depends=('glibc')
optdepends=('python')
makedepends=('python')
license=('GPL')
options=(!libtool)
source=(ftp://ftp.alsa-project.org/pub/lib/$pkgname-$pkgver.tar.bz2)
md5sums=('73b0986758bb762648a5fafc93e287c1')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
