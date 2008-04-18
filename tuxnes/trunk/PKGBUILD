# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=tuxnes
pkgver=0.75
pkgrel=1
pkgdesc="TuxNES is based on Nestra, a great public-domain NES emulator"
source=(http://unc.dl.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
url="http://tuxnes.sourceforge.net/"
build() {
cd $startdir/src/$pkgname-$pkgver
./configure --prefix=/usr
make || return 1
make prefix=$startdir/pkg/usr install
}
