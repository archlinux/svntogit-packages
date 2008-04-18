# $Id$
# Maintainer: Mark Rosenstand <mark@archlinux.org>
# Contributor: Manolis Tzanidakis
pkgname=libdaemon
pkgver=0.12
pkgrel=1
pkgdesc="A lightweight C library which eases the writing of UNIX daemons."
arch=('i686' 'x86_64')
license=('LGPL')
url="http://0pointer.de/lennart/projects/libdaemon/"
depends=('glibc')
source=(http://0pointer.de/lennart/projects/libdaemon/$pkgname-$pkgver.tar.gz)
md5sums=('76596823cc1a6d1cdf7779b782ff0ee6')
sha1sums=('2b45ab37df853afd25f7985ed699b799e0464413')
options=('!libtool')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-doxygen --disable-lynx
  make || return 1
  make DESTDIR=$startdir/pkg install
}

