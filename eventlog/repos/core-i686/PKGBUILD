# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=eventlog
pkgver=0.2.5
pkgrel=2
pkgdesc="A new API to format and send structured log messages"
arch=('i686' 'x86_64')
url="http://www.balabit.com/support/community/products/"
license=('BSD')
depends=('glibc')
options=('!libtool')
source=(http://www.balabit.com/downloads/files/eventlog/0.2/eventlog-$pkgver.tar.gz)
md5sums=('a6bdba91f88540cc69b398fd138d86cd')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
