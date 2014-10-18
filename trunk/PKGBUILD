# Contributor: Antonio Rojas

pkgname=powerdevil
pkgver=5.1.0.1
pkgrel=1
pkgdesc='KDE power management tools'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/extragear/base/powerdevil'
license=('LGPL')
depends=('plasma-workspace')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
conflicts=('kdebase-workspace')
source=("http://download.kde.org/stable/plasma/5.1.0/$pkgname-$pkgver.tar.xz")
md5sums=('4d0d05084c1f198089dfb25325b35d1f')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-5.1.0 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DSYSCONF_INSTALL_DIR=/etc
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
