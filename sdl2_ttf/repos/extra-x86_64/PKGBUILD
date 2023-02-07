# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=sdl2_ttf
pkgver=2.20.2
pkgrel=1
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications (Version 2)"
arch=('x86_64')
url="https://github.com/libsdl-org/SDL_ttf"
license=('MIT')
depends=('sdl2' 'freetype2')
source=("https://github.com/libsdl-org/SDL_ttf/releases/download/release-${pkgver}/SDL2_ttf-${pkgver}.tar.gz"{,.sig})
sha512sums=('b54e93b100712e3764cd80d4e4b16cd4c2a6853620f675941a4214320b0ee29a583d57ad56cd5fdb5c7a32d7615cbf43bc3fa55337b01623cee7219ebb43667c'
            'SKIP')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6')

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
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
