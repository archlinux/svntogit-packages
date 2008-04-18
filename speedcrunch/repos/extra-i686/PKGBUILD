# $Id$
# Maintainer: damir <damir@archlinux.org>

 pkgname=speedcrunch
 pkgver=0.9
 pkgrel=1
 pkgdesc="a simple but powerful calculator using QT"
 arch=(i686 x86_64)
 depends=('qt>=4.2.0')
 license=("GPL2")
 source=(http://speedcrunch.googlecode.com/files/$pkgname-$pkgver.tar.gz)
 url="http://speedcrunch.org/"

 build() {
   cd $startdir/src/$pkgname-$pkgver/src
   cmake . -DCMAKE_INSTALL_PREFIX=/usr || return 1
   make || return 1
   make DESTDIR=$startdir/pkg install
 }


md5sums=('4eab7365251c886ac203986c89c24e38')
