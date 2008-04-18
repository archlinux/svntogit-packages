# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=procps
pkgver=3.2.7
pkgrel=4
pkgdesc="Utilities for monitoring your system and processes on your system"
arch=(i686 x86_64)
url="http://procps.sf.net"
license=('LGPL')
groups=('base')
depends=('ncurses')
backup=('etc/sysctl.conf')
source=(http://procps.sourceforge.net/procps-$pkgver.tar.gz sysctl.conf)
md5sums=('f490bca772b16472962c7b9f23b1e97d' '03571b4a24037f8ac283f3d8af02423f')

build() {
  cd $startdir/src/$pkgname-$pkgver 
  /bin/sed -i "s:\$(lib64):lib:" Makefile
  make || return 1
  make DESTDIR=$startdir/pkg ldconfig=/bin/true install
  install -D -m644 ../sysctl.conf $startdir/pkg/etc/sysctl.conf
  install -d $startdir/pkg/usr/include/proc
  install -m644 proc/*.h $startdir/pkg/usr/include/proc
}
