# $Id$
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Maintainer: damir <damir@archlinux.org>

pkgname=stellarium
pkgver=0.9.1
pkgrel=2
pkgdesc="A stellarium with great graphics and a nice database of sky-objects"
arch=("i686" "x86_64")
url="http://stellarium.free.fr/"
license=('GPL2')
depends=('libpng' 'mesa' 'sdl_mixer' 'libgl' 'freetype2' 'curl' 'qt>=4.3')
makedepends=('cmake' 'boost')
source=("http://puzzle.dl.sourceforge.net/sourceforge/stellarium/$pkgname-$pkgver.tar.gz")

build() {
  cd $startdir/src/$pkgname-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install
}
md5sums=('d0d55cb1ff5acd08a4d3b27d953579c0')
