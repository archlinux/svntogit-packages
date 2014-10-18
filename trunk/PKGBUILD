# Contributor: Antonio Rojas

pkgname=kde-cli-tools
pkgver=5.1.0.1
pkgrel=1
pkgdesc="Tools based on KDE Frameworks 5 to better interact with the system"
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/kde/workspace/kde-cli-tools'
license=('LGPL')
depends=('kdesu' 'kdelibs4support' 'kcmutils')
makedepends=('extra-cmake-modules' 'kdoctools' 'python')
source=("http://download.kde.org/stable/plasma/5.1.0/$pkgname-$pkgver.tar.xz")
md5sums=('1242ac2fad01ad771ea7c6834b66437a')

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
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install

# conflicts with kdebase-runtime
  rm -r "$pkgdir"/usr/share/man
}
