# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=sdl2_ttf
pkgver=2.0.15
pkgrel=1
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications (Version 2)"
arch=('x86_64')
url="http://www.libsdl.org/projects/SDL_ttf"
license=('MIT')
depends=('sdl2' 'freetype2')
makedepends=('cmake')
source=("https://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${pkgver}.tar.gz")
sha512sums=('30d685932c3dd6f2c94e2778357a5c502f0421374293d7102a64d92f9c7861229bf36bedf51c1a698b296a58c858ca442d97afb908b7df1592fc8d4f8ae8ddfd')

prepare() {
  cd SDL2_ttf-${pkgver}

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
