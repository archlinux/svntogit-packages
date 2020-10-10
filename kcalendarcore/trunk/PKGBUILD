# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kcalendarcore
pkgver=5.75.0
pkgrel=1
pkgdesc="The KDE calendar access library"
arch=(x86_64)
url="https://community.kde.org/Frameworks"
license=(LGPL)
depends=(libical qt5-base)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc)
conflicts=(kcalcore)
provides=(kcalcore)
replaces=(kcalcore)
groups=(kf5)
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('02ff08c6462a5f0552c85a1da98320ca0a1c8d7295a05230f4b27b7a3f0a3dbc'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
