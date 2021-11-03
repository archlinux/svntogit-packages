# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgbase=libdbusmenu-qt
pkgname=(libdbusmenu-qt5 libdbusmenu-qt6)
pkgver=0.9.3+16.04.20160218
pkgrel=6
pkgdesc='A library that provides a Qt implementation of the DBusMenu spec'
arch=(x86_64)
url='https://github.com/desktop-app/libdbusmenu-qt'
license=(GPL)
makedepends=(cmake doxygen qt5-base qt6-base)
source=(http://archive.ubuntu.com/ubuntu/pool/main/libd/$pkgbase/${pkgbase}_$pkgver.orig.tar.gz
        https://github.com/desktop-app/libdbusmenu-qt/commit/af9fa001.patch
        libdbusmenu-qt6-cmake.patch)
sha256sums=('a8e6358a31c44ccdf1bfc46c95a77a6bfc7fc1f536aadb913ed4f4405c570cf6'
            'a853330e5d1edc12b5032d6826ba6c2c1ad1eb3d43cee913c9bc4b97d6fe5561'
            'ccd4e73afb360229eb59661257476ce5a1137d43f1bb0c30e1786f4365160ac2')

prepare() {
  patch -d $pkgbase-$pkgver -p1 < af9fa001.patch # Support Qt6
  patch -d $pkgbase-$pkgver -p1 < libdbusmenu-qt6-cmake.patch
  sed -e '/tests/d' -i $pkgbase-$pkgver/CMakeLists.txt # Build fails with Qt6
}

build() {
  cmake -B build5 $pkgbase-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT5=ON
  cmake --build build5

  cmake -B build6 $pkgbase-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT6=ON
  cmake --build build6
}

package_libdbusmenu-qt5() {
  depends=(qt5-base)

  DESTDIR="$pkgdir" cmake --install build5
}

package_libdbusmenu-qt6() {
  depends=(qt6-base)

  DESTDIR="$pkgdir" cmake --install build6
}
