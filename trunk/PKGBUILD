# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=sdl2_ttf
pkgver=2.0.18
pkgrel=1
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications (Version 2)"
arch=('x86_64')
url="http://www.libsdl.org/projects/SDL_ttf"
license=('MIT')
depends=('sdl2' 'freetype2')
makedepends=('cmake')
source=("https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${pkgver}.tar.gz")
sha512sums=('9a211c07d4180fe3fb2f7614e907d1002ddf3bb77b57f62116f22dc29a6043f091deb6a8113656d26a44d2f06b9abcc372aa3e0761500fcf47b455406973a1c7')

prepare() {
  cd SDL2_ttf-${pkgver}

  autoreconf -vi
}

build() {
  cd "${srcdir}/SDL2_ttf-${pkgver}/"

  ./configure --disable-static --prefix=/usr
  make
}

package() {
  cd "${srcdir}/SDL2_ttf-${pkgver}/"

  make DESTDIR="${pkgdir}/" install
  install -Dm644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
