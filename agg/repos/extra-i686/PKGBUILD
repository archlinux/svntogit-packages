pkgname=agg
pkgver=2.5
pkgrel=2
pkgdesc="A High Quality Rendering Engine for C++"
arch=('i686' 'x86_64')
url="http://www.antigrain.com/"
license=('GPL')
depends=('gcc-libs' 'sdl' 'freetype2')
makedepends=('automake')
options=('!libtool' '!makeflags')
source=(http://www.antigrain.com/$pkgname-$pkgver.tar.gz)
md5sums=('0229a488bc47be10a2fee6cf0b2febd6')
provides=('antigrain')
replaces=('antigrain')

build() {
  cd "$startdir/src/$pkgname-$pkgver"

  sh ./autogen.sh
  ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
