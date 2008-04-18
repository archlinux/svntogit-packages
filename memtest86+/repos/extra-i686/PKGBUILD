# $Id$
#Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=memtest86+
pkgver=2.01
pkgrel=1
pkgdesc="An advanced memory diagnostic tool"
arch=(i686 x86_64)
url="http://www.memtest.org"
depends=()

source=(http://www.memtest.org/download/$pkgver/$pkgname-$pkgver.tar.gz)
source=(http://www.memtest.org/download/$pkgver/$pkgname-$pkgver.bin.gz)
md5sums=('e849eaf4ff3f6f4d7aff32d3dfa1b32c')
[ "$CARCH" = "x86_64" ] && md5sums=('d55b96702d4f4fb7b87f5712c74839cd')
install=memtest86+.install

build() {
 if [ "$CARCH" = "x86_64" ]; then
   install -m644 -D $startdir/src/$pkgname-$pkgver.bin $startdir/pkg/boot/memtest86+/memtest.bin   
  else
   cd $startdir/src/$pkgname-$pkgver
   make memtest.bin
   install -m644 -D memtest.bin $startdir/pkg/boot/memtest86+/memtest.bin
 fi
}
