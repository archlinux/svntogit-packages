# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qqc2-desktop-style
pkgver=5.40.0
pkgrel=3
pkgdesc='A style for Qt Quick Controls 2 to make it follow your desktop theme'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
groups=(kf5)
depends=(kirigami2 kiconthemes)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz"{,.sig}
        qqc2-versioning.patch)
sha256sums=('89ec1b98a3b9491f37cd3c13ff6ec047d773efb0fb697c14b9a8388fb0b6ed4a'
            'SKIP'
            '3ab65d9155cfa5c3be9b173f53bc032bd5d0b634c86aa3e366c800c7012eed10')
validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>

prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
  patch -p1 -i ../qqc2-versioning.patch # Determine QQC2 version at build time https://bugs.kde.org/show_bug.cgi?id=386289
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
