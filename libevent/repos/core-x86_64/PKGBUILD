# $Id$
# Maintainer: Judd <jvinet@zeroflux.org>

pkgname=libevent
pkgver=1.3e
pkgrel=1
pkgdesc="a mechanism to execute a callback function when a specific event occurs on a file descriptor or after a timeout has been reached"
license=('GPL2')
arch=(i686 x86_64)
url="http://www.monkey.org/~provos/libevent/"
depends=('glibc')
source=(http://www.monkey.org/~provos/libevent-$pkgver.tar.gz)
options=(!libtool)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('8553ad0f8a35d8d96ae0c69c387e06d3')
