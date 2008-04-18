# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Roberto Carvajal <rcarvajal@users.sf.net>

pkgname=xmahjongg
pkgver=3.7
pkgrel=2
pkgdesc="Mahjongg game for X-Window"
depends=('gcc' 'libsm' 'libx11')
source=(http://www.lcdf.org/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('9db5bf1b329b410220b7976cd9b3d374')
url="http://www.lcdf.org/xmahjongg/"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
}
