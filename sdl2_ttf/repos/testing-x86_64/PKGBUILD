# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=sdl2_ttf
pkgver=2.0.14
pkgrel=2
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications (Version 2)"
arch=('x86_64')
url="http://www.libsdl.org/projects/SDL_ttf"
license=('MIT')
depends=('sdl2' 'freetype2')
makedepends=('cmake')
source=("https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${pkgver}.tar.gz"
        freetype-pkgconfig.patch)
sha512sums=('4db817573fd216e26180f4c401cc869ce407589a461032fd7167dc612d35e038cca1ab67be7909b6b49c741581a68125ab46362ad8e3c0a2cdd39624ad847099'
            'abb3fd400c5d44789b891bad53124ca135ea3125affb95621623ab22fc43f5fbfeb79c63a97648936faf4698180837f76ca57143ee401610106d08741610e937')

prepare() {
  cd SDL2_ttf-${pkgver}

  # Fix build with FreeType 2.9.1
  patch -Np1 -i ../freetype-pkgconfig.patch

  touch NEWS README AUTHORS ChangeLog
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
