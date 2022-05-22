# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=kcolorpicker
pkgver=0.2.0
pkgrel=1
pkgdesc='Qt based Color Picker with popup menu'
arch=(x86_64)
url='https://github.com/DamirPorobic/kColorPicker'
license=(GPL)
makedepends=(cmake)
depends=(qt5-base)
source=(https://github.com/ksnip/kColorPicker/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('20ffc5e935333a18c5cd813c3d306d3482ec9c826fe0d0c3d7b7635419703d55')

build() {
  cmake -B build -S kColorPicker-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_SHARED_LIBS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
