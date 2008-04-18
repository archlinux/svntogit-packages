# $Id$
# Maintainer: arjan <arjan@archlinux.org>
pkgname=libusb
pkgver=0.1.12
pkgrel=3
depends=('gcc-libs')
pkgdesc="Library to enable user space application programs to communicate with USB devices"
arch=(i686 x86_64)
url="http://libusb.sourceforge.net/"
license=('LGPL')
groups=('base')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('caf182cbc7565dac0fd72155919672e6' '11a076ed0afd7804a3206a4f34ecf7ad')
options=(!libtool)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --disable-build-docs
  make || return 1
  make DESTDIR=$startdir/pkg install
}
