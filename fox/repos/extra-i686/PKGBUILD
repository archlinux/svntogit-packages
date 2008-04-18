# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=fox
pkgver=1.6.32
pkgrel=1
pkgdesc="Free Objects for X: GUI Toolkit for C++"
arch=("i686" "x86_64")
url="http://www.fox-toolkit.org/"
license=('LGPL' 'custom')
depends=('bzip2' 'libcups' 'libxcursor' 'libxft' 'libxrandr' 'mesa')
options=('!libtool')
source=("http://www.fox-toolkit.org/ftp/$pkgname-$pkgver.tar.gz")

build() {
  cd $startdir/src/$pkgname-$pkgver

  CPPFLAGS="$CPPFLAGS -I/usr/include/freetype2"

  ./configure   --prefix=/usr \
                --enable-release \
                --with-xft=yes \
                --enable-cups \
                --with-opengl=yes
  make || return 1
  make DESTDIR=$startdir/pkg/ install

  cd $startdir/src/$pkgname-$pkgver/tests
  make ControlPanel || return 1
  cp $startdir/src/$pkgname-$pkgver/tests/.libs/ControlPanel $startdir/pkg/usr/bin/
  install -D -m644 ../LICENSE_ADDENDUM $startdir/pkg/usr/share/licenses/$pkgname/LICENSE_ADDENDUM
}

md5sums=('66f0a1d316d15d8eee78a8774e9dd8a7')
