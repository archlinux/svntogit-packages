# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=sdl2_ttf
pkgver=2.0.12
pkgrel=1
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications (Version 2)"
arch=('i686' 'x86_64')
url="http://www.libsdl.org"
license=('MIT')
depends=('sdl2' 'freetype2')
makedepends=('cmake')
options=(!libtool)
source=("http://www.libsdl.org/tmp/SDL_ttf/release/SDL2_ttf-${pkgver}.tar.gz")
md5sums=('a0925e117cc5f0fb7cf2a66c7968c117')

build() {
  cd "${srcdir}/SDL2_ttf-${pkgver}/"

  ./autogen.sh
  ./configure --disable-static --prefix=/usr
  make
}

package() {
  cd "${srcdir}/SDL2_ttf-${pkgver}/"

  make DESTDIR="${pkgdir}/" install

  install -Dm644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
