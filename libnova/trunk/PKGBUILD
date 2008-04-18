# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libnova
pkgver=0.12.1
pkgrel=1
pkgdesc="libnova is a general purpose, double precision, celestial mechanics, astrometry and astrodynamics library."
url="http://libnova.sourceforge.net/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=()
makedepends=('pkgconfig')
source=(http://switch.dl.sourceforge.net/sourceforge/libnova/$pkgname-$pkgver.tar.gz)
options=(!libtool)

build() {
        cd $startdir/src/$pkgname-$pkgver
         ./configure --prefix=/usr
        make || return 1
        make DESTDIR=$startdir/pkg install
}
md5sums=('f0bffb2eb0bfa041e4c4d9764aadd94d')
