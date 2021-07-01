# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kdsoap-ws-discovery-client
pkgver=git20200927
pkgrel=2
_commit=dcefb65c88e76f1f9eda8b0318006e93d15a0e1e
pkgdesc='WS-Discovery client library based on KDSoap'
license=(GPL3 custom)
arch=(x86_64)
url='https://caspermeijn.gitlab.io/kdsoap-ws-discovery-client/'
depends=(kdsoap)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc)
source=(https://gitlab.com/caspermeijn/kdsoap-ws-discovery-client/-/archive/$_commit/$pkgname-$_commit.tar.gz)
sha256sums=('8b80ac16fe4b7a0c2cd319eaaa2fd2d03c8c01e15298f62c14574fe53925b8d8')

build() {
  cmake -B build -S $pkgname-$_commit \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir"/$pkgname-$_commit/LICENSES/* -t "$pkgdir"/usr/share/licenses/$pkgname
}
