# Maintainer: Antonio Rojas 
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Timothée Ravier <tim@siosm.fr>

pkgname=libmm-qt5
pkgver=5.1.0.1
pkgrel=1
pkgdesc='Qt-only wrapper for ModemManager DBus API'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/libs/libnm-qt'
license=('LGPL')
depends=('modemmanager' 'qt5-base')
makedepends=('extra-cmake-modules')
source=("http://download.kde.org/stable/plasma/5.1.0/libmm-qt-$pkgver.tar.xz")
md5sums=('c2c4e750b603af4b178f2457e26d5564')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libmm-qt-5.1.0 \
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
