# Maintainer:
# Contributor: Solomon Choina <shlomochoina@gmail.com>

pkgname=dht
pkgver=0.26
pkgrel=3
pkgdesc='BitTorrent DHT library'
arch=(x86_64)
url='https://github.com/jech/dht'
license=(MIT)
makedepends=(cmake)
source=(https://github.com/jech/dht/archive/refs/tags/$pkgname-$pkgver.tar.gz
        dht-cmake.patch::https://github.com/transmission/dht/commit/b02da598.patch)
sha256sums=('3873d54b786cf74090672ed6f786b82510ae375d5a8d8f4d99314e358d898baa'
            '91fb75029bf04456bb7fd9c7cc14d544e906d35a309cc8de5be081049aeb7649')

prepare() {
  patch -d dht-dht-$pkgver -p1 < dht-cmake.patch # Add cmake support
}

build() {
  cmake -B build -S dht-dht-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_INCLUDEDIR=include/dht \
    -DCMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 dht-dht-$pkgver/LICENCE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE 
}
