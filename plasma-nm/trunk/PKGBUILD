# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=plasma-nm
pkgver=5.1.0.1
pkgrel=1
pkgdesc='Plasma applet written in QML for managing network connections'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/playground/network/plasma-nm'
license=('GPL2')
depends=('plasma-workspace' 'libmm-qt5' 'libnm-qt5')
makedepends=('extra-cmake-modules' 'kdoctools' 'openconnect' 'python')
optdepends=('mobile-broadband-provider-info: Database of mobile broadband service providers' 'openconnect: Cisco AnyConnect VPN plugin')
source=("http://download.kde.org/stable/plasma/5.1.0/$pkgname-$pkgver.tar.xz")
md5sums=('ef286d4c8d0644b9e8e5de7f8fec81ed')

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../plasma-nm-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
