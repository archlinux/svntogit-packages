# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kio-fuse
pkgver=5.0.1
pkgrel=1
arch=(x86_64)
pkgdesc="FUSE interface for KIO"
url="https://kde.org/"
license=(GPL)
depends=(kio fuse3)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('66679a8bf68fe60e19f31449f4110d4cf822915b3d245af3c0cd0056081466dd'
            'SKIP')
validpgpkeys=('21EC3FD75D26B39E820BE6FBD27C2C1AF21D8BAD') # Fabian Vogt <fabian@ritter-vogt.de>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
