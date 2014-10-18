# Contributor: Antonio Rojas

pkgname=systemsettings
pkgver=5.1.0.1
pkgrel=1
pkgdesc='KDE system settings'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/systemsettings'
license=('LGPL')
depends=('kcmutils' 'khtml' 'kdelibs4support')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
conflicts=('kdebase-workspace')
source=("http://download.kde.org/stable/plasma/5.1.0/$pkgname-$pkgver.tar.xz")
md5sums=('df3018fab2f117c60a79ea5020ff513f')

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
