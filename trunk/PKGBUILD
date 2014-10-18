# Contributor: Antonio Rojas

pkgname=kmenuedit
pkgver=5.1.0.1
pkgrel=1
pkgdesc='KDE menu editor'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/kmenuedit'
license=('LGPL')
depends=('khotkeys')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
conflicts=('kdebase-workspace')
source=("http://download.kde.org/stable/plasma/5.1.0/$pkgname-$pkgver.tar.xz")
md5sums=('63d1ec5c1c401c986b1442d08adb3a91')

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
