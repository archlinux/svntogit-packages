# $Id$
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=libdca
pkgver=0.0.5
pkgrel=1
pkgdesc="Free library for decoding DTS Coherent Acoustics streams"
arch=(i686 x86_64)
license=('GPL')
url="http://www.videolan.org/developers/libdca.html"
source=(http://download.videolan.org/pub/videolan/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('dab6b2795c66a82a6fcd4f8343343021')
provides=('libdts')
replaces=('libdts')
options=('!libtool' '!emptydirs')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
