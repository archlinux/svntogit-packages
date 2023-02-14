# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qqc2-desktop-style
pkgver=5.103.0
pkgrel=1
pkgdesc='A style for Qt Quick Controls 2 to make it follow your desktop theme'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
groups=(kf5)
depends=(kirigami2 kiconthemes sonnet)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('f18eba0ca9e6f5e2133c7108ee2c48243c498112d4d6dceeecf8a63d17b728a5'
            'SKIP')
validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
