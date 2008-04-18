# $Id$
# Maintainer: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=xosd
pkgver=2.2.14
pkgrel=1
pkgdesc="XOSD displays text on your screen. On-Screen-Display-libs for some tools."
arch=("i686" "x86_64")
license=('GPL2')
url="http://www.ignavus.net/software.html"
depends=('libxt' 'libxinerama' 'gdk-pixbuf')
makedepends=('xmms' 'bmp')
options=(!libtool)
#source=("http://www.ignavus.net/xosd-$pkgver.tar.bz2")
source=("http://ftp.de.debian.org/debian/pool/main/x/xosd/xosd_$pkgver.orig.tar.gz")

build() {
  cd $startdir/src/xosd-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg/ install
}


md5sums=('4b349fe930e4eee2f504d6c02673e24d')
