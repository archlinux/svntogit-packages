# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=xdg-utils-cxx
pkgver=1.0.1
pkgrel=2
_commit=6e6428a3248566ef0fd0c448fda8eb83e8835c31
pkgdesc="Implementation of the FreeDesktop specifications to be used in C++ projects"
arch=(x86_64)
url="https://github.com/azubieta/xdg-utils-cxx"
license=(MIT)
depends=()
makedepends=(cmake)
source=($pkgname-$pkgver.tar.gz::"https://github.com/azubieta/xdg-utils-cxx/archive/v$pkgver.tar.gz")
sha256sums=('2cdeda2385faa0ce496a5b276f5145f2dfb3f67ee77789cf8f57752abc83e69b')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS} -fPIC"
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
