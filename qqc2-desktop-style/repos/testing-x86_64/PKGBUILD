# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qqc2-desktop-style
pkgver=5.68.0
pkgrel=1
pkgdesc='A style for Qt Quick Controls 2 to make it follow your desktop theme'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
groups=(kf5)
depends=(kirigami2 kiconthemes)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('0f522861e5757de6a1205c86a2e5f8d2a7375c96eac1ece95d03a35858dc7b03'
            'SKIP')
validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
