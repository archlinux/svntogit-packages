# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qqc2-desktop-style
pkgver=5.10.95
pkgrel=1
pkgdesc='A style for Qt Quick Controls 2 to make it follow your desktop theme'
arch=(i686 x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
#groups=(kf5)
depends=(qt5-quickcontrols2)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/unstable/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('bafa0600f096826ba371a1e1366e04b6c9a47c7de81cb403df1caec5d809d82f'
            'SKIP')
# validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>
validpgpkeys=(2D1D5B0588357787DE9EE225EC94D18F7F05997E) # Jonathan Riddell <jr@jriddell.org>

prepare() {
  mkdir -p build
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
