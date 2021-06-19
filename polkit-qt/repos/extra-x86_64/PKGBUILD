# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=polkit-qt
pkgname=(polkit-qt5)
pkgver=0.114.0
pkgrel=1
pkgdesc='A library that allows developers to access PolicyKit API with a nice Qt-style API'
arch=(x86_64)
url='https://www.kde.org/'
license=(LGPL)
depends=(polkit qt5-base)
makedepends=(cmake)
source=(https://download.kde.org/stable/$pkgbase-1/$pkgbase-1-$pkgver.tar.xz{,.sig})
sha256sums=('2eb0f22445888295ffa2bfbc0c3693847a0f973bb6b0c3e4cce0218be7e3907e'
            'SKIP')
validpgpkeys=(D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heirecka@exherbo.org>

build() {
  cmake -B build -S $pkgbase-1-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package_polkit-qt5() {
  DESTDIR="$pkgdir" cmake --install build
}
