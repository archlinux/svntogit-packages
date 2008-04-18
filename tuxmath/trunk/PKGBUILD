# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=tuxmath
pkgver=2001.09.07
pkgrel=2
pkgdesc="'Tux of Math Command' is an educational math tutorial game for elementary school level children"
depends=('sdl' 'sdl_mixer' 'sdl_image')
source=(http://unc.dl.sourceforge.net/$pkgname/$pkgname-$pkgver-0102.tar.gz)
url="http://www.geekcomix.com/dm/tuxmath/downloads/"
build() {
cd $startdir/src/$pkgname
./configure --prefix=/usr
mkdir -p $startdir/pkg/usr/bin $startdir/pkg/usr/share/tuxmath
make || return 1
make BIN_PREFIX=$startdir/pkg/usr/bin DATA_PREFIX=$startdir/pkg/usr/share/tuxmath install
}
