# Contributor: Antonio Rojas

pkgname=libksysguard
pkgver=5.1.0.1
pkgrel=1
pkgdesc='Libksysguard'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/libksysguard'
license=('LGPL')
depends=('libxres' 'kdelibs4support' 'plasma-framework')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
conflicts=('kdebase-workspace')
source=("http://download.kde.org/stable/plasma/5.1.0/$pkgname-$pkgver.tar.xz")
md5sums=('6ade40ebcb153a99a00dcc9364ad2382')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-5.1.0 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DSYSCONF_INSTALL_DIR=/etc \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
