# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=libqaccessibilityclient
pkgver=0.4.1
pkgrel=2
arch=(x86_64)
pkgdesc="Helper library to make writing accessibility tools easier"
url='https://www.kde.org'
license=(LGPL2.1)
depends=(qt5-base)
makedepends=(extra-cmake-modules)
conflicts=(libkdeaccessibilityclient)
source=("https://download.kde.org/stable/$pkgname/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('1c768b4f4314fcae2a07cb7de7cb2ae0522b5f02b4173af3eed8bfb2a4d83429'
            'SKIP')
validpgpkeys=(FB25861861063C64C97B89AE125C53EB96EC0C92  # Frederik Gladhorn <frederik@gladhorn.de>
              2D1D5B0588357787DE9EE225EC94D18F7F05997E) # Jonathan Riddell <jr@jriddell.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
