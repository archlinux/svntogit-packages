# Contributor: Antonio Rojas

pkgname=kwrited
pkgver=5.1.0.1
pkgrel=1
pkgdesc='Kwrited'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/kwrited'
license=('LGPL')
depends=('kpty' 'kdelibs4support')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
source=("http://download.kde.org/stable/plasma/5.1.0/$pkgname-$pkgver.tar.xz")
md5sums=('9913b37a67d71a0f937c8da070923e77')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-5.1.0 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_AS_EXECUTABLE=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
