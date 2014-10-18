# Contributor: Antonio Rojas

pkgname=milou
pkgver=5.1.0.1
pkgrel=1
pkgdesc="A dedicated search application built on top of Baloo"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/milou/'
license=('LGPL')
depends=('krunner')
provides=('milou-frameworks')
conflicts=('milou-frameworks')
replaces=('milou-frameworks')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
source=("http://download.kde.org/stable/plasma/5.1.0/$pkgname-$pkgver.tar.xz")
md5sums=('950d51cbd896a60872efeecd876ab424')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-5.1.0 \
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
