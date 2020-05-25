# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: hauptmech, figo.zhang, chubtuff, lubosz
#
# Matlab bindings are not built by default to reduce dependencies.

pkgname=gl2ps
pkgver=1.4.2
pkgrel=2
pkgdesc="an OpenGL to PostScript printing library"
arch=('x86_64')
url='https://geuz.org/gl2ps/'
license=('LGPL')
depends=('libpng' 'libgl')
makedepends=('cmake' 'texlive-core')
source=("https://geuz.org/gl2ps/src/gl2ps-${pkgver}.tgz")
sha512sums=('46652e1b3825ace61dbd77c4b0bf451e7671c248eb18bbd3369e2fac00056ea4cd5d2578561984313c239e3b02f78b9d9a76d963c935af65a13bc2abfc538620')

prepare() {
  mkdir build
}

build() {
  cd build
  export FORCE_SOURCE_DATE=1 # make pdftex adhere to SOURCE_DATE_EPOCH
  cmake ../gl2ps-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_EXE_LINKER_FLAGS=-lm
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir/" install
}

