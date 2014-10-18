# Contributor: Antonio Rojas

pkgname=libkscreen-frameworks
pkgver=5.1.0.1
pkgrel=1
pkgdesc='KDE screen management software'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/libs/libkscreen'
license=('LGPL')
depends=('qt5-x11extras' 'libxrandr')
makedepends=('extra-cmake-modules')
source=("http://download.kde.org/stable/plasma/5.1.0/libkscreen-$pkgver.tar.xz")
md5sums=('95f0c03c280a9be82664e607cf760e39')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../libkscreen-5.1.0 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
