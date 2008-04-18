# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=jfsutils
pkgver=1.1.12
pkgrel=2
pkgdesc="JFS filesystem utilities"
arch=(i686 x86_64)
url="http://jfs.sourceforge.net"
license=('GPL')
groups=('base')
depends=('e2fsprogs')
source=(http://jfs.sourceforge.net/project/pub/jfsutils-$pkgver.tar.gz)
md5sums=('10efa993a62113530645fc7b3fa542f4')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  mv $startdir/pkg/usr/sbin $startdir/pkg
}
