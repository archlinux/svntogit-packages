# $Id$
# Maintainer: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gfpoken
pkgver=0.25
pkgrel=1
pkgdesc="GFingerPoken is a black-box type game for gtk 1.2 or higher"
depends=('gtk')
source=(http://gfpoken.bigw.org/$pkgname-$pkgver.tar.gz)
url="http://gfpoken.bigw.org/"
build() {
cd $startdir/src/$pkgname-$pkgver
./configure --prefix=/usr
make || return 1
make prefix=$startdir/pkg/usr install
}
