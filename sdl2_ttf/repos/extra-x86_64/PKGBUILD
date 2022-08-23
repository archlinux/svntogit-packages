# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=sdl2_ttf
pkgver=2.20.1
pkgrel=1
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications (Version 2)"
arch=('x86_64')
url="https://github.com/libsdl-org/SDL_ttf"
license=('MIT')
depends=('sdl2' 'freetype2')
source=("https://github.com/libsdl-org/SDL_ttf/releases/download/release-${pkgver}/SDL2_ttf-${pkgver}.tar.gz"{,.sig})
sha512sums=('5745a318583a771dff30421d79c5940bdb0fe2f8908a0192e98a2a80076722ba53f6488e922de5b49e078f0c7d9d358e681886ebc8862d89ca6671b5be471134'
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
