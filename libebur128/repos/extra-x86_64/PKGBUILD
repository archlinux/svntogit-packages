# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: BoosterDEV <booster DOT devel AT gmail DOT com>

pkgname=libebur128
pkgver=1.2.6
pkgrel=1
pkgdesc="A library that implements the EBU R 128 standard for loudness normalisation."
arch=(x86_64)
url="https://github.com/jiixyj/libebur128"
license=(MIT)
depends=(glibc)
makedepends=(cmake)
source=($pkgname-$pkgver.tar.gz::"https://github.com/jiixyj/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('baa7fc293a3d4651e244d8022ad03ab797ca3c2ad8442c43199afe8059faa613')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_STATIC_LIBS=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 $pkgname-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
