# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=uim
pkgver=1.4.2
pkgrel=1
pkgdesc="multilingual input method library"
arch=("i686" "x86_64")
license=('custom')
url="http://code.google.com/p/uim/"
depends=('gnome-panel' 'm17n-lib')
source=("http://uim.googlecode.com/files/$pkgname-$pkgver.tar.gz")

options=(!libtool)

build() {
     cd $startdir/src/$pkgname-$pkgver
     ./configure --prefix=/usr
     make || return 1
     make DESTDIR=$startdir/pkg install || return 1
     install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}

md5sums=('7898dd27ace119b63ad490cad46b812e')
