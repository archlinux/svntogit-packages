# $Id$
# Contributor: Alois Nespor <alois.nespor@gmail.com>
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=clucene
pkgver=0.9.20
pkgrel=1
pkgdesc="CLucene is a C++ port of Lucene: A high-performance, full-featured text search engine."
arch=('i686' 'x86_64')
url="http://clucene.sourceforge.net"
license=('APACHE' 'LGPL')
depends=('gcc-libs')
makedepends=('libtool' 'autoconf' 'automake' 'doxygen')
options=(!libtool)
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-core-$pkgver.tar.bz2)
options=(!libtool)

build() {
  cd "$startdir/src/$pkgname-core-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
md5sums=('da62da5d23b17fec67f0175481a603b8')
