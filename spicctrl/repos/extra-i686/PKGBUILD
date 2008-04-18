# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
# Contributer: Jason Chu <jchu@xentac.net>
pkgname=spicctrl
pkgver=1.9
pkgrel=1
pkgdesc="Spic control"
depends=('glibc')
source=(http://popies.net/sonypi/$pkgname-$pkgver.tar.bz2)
url="http://popies.net/sonypi/"

build() {
   cd $startdir/src/$pkgname-$pkgver
   make || return 1
   mkdir -p $startdir/pkg/usr/bin
   cp $pkgname $startdir/pkg/usr/bin
}
