# Maintainer: Antonio Rojas 
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=libnm-qt5
pkgver=5.1.0.1
pkgrel=1
pkgdesc='Qt-only wrapper for NetworkManager DBus API'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/libs/libnm-qt'
license=('LGPL')
depends=('networkmanager' 'qt5-base')
makedepends=('extra-cmake-modules')
source=("http://download.kde.org/stable/plasma/5.1.0/libnm-qt-$pkgver.tar.xz")
md5sums=('8d71afd748b32c2b67b929e37866323a')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libnm-qt-5.1.0 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
