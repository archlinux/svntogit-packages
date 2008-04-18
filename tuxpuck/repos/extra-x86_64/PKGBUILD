# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=tuxpuck
pkgver=0.8.2
pkgrel=1
pkgdesc="Airhockey with tux"
url="http://home.no.net/munsuun/tuxpuck/"
depends=('libjpeg' 'sdl' 'libpng' 'libvorbis')
source=(http://home.no.net/munsuun/tuxpuck/files/$pkgname-$pkgver.tar.gz)
md5sums=('fc839abc2b1f3eafae397e1ed6487079')

build() {
  cd $startdir/src/$pkgname-$pkgver
   make || return 1
   make DESTDIR=$startdir/pkg/ install
 }
