# $Id$
# Maintainer: Thomas Baechler <thomas@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libdvdread
pkgver=0.9.7
pkgrel=1
arch=(i686 x86_64)
pkgdesc="libdvdread provides a simple foundation for reading DVD video disks"
depends=('glibc')
makedepends=('libdvdcss')
install=$pkgname.install
options=('NOLIBTOOL')
source=(http://www.dtek.chalmers.se/groups/dvd/dist/$pkgname-$pkgver.tar.gz)
url="http://www.dtek.chalmers.se/groups/dvd/downloads.shtml"
md5sums=('078788c9241ae16763529e1235502337')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
