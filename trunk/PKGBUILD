# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=extra-cmake-modules
pkgver=5.54.0
pkgrel=2
pkgdesc='Extra modules and scripts for CMake'
arch=(any)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(cmake)
makedepends=(python-sphinx python-requests qt5-tools)
groups=(kf5)
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz"{,.sig}
        ECM-Qt5.12.patch ECM-no-init.py.patch
        ECM-qmake-Qt5.12.1.patch::https://cgit.kde.org/extra-cmake-modules.git/patch/?id=79bf2300)
sha256sums=('91b7a9359f1bfe6f667a5a9c23f6b2178555df26ca2e4dd1bb5c38dc36c77144'
            'SKIP'
            'e1144c9f84fc1fc69d85d8b32dab56c0c49802094b94c5e999504a6977463f86'
            '5695e45c7621a00c0bca28f058c13b5d524f963a00b53337c8cefcdaf22c4b52'
            'f792c4f1a4ee4f8ad94bcfb4aca81bf0d0d1e7f229bbad6a077b683deffeffff')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
  sed -e 's|/usr/bin/env python|/usr/bin/env python2|' -i find-modules/*.py
# Don't create __init__.py
  patch -p1 -i ../ECM-no-init.py.patch
# Fix Qt doc build with Qt 5.12
  patch -p1 -i ../ECM-Qt5.12.patch
# Fix qmake module generation for Qt 5.12.1
  patch -p1 -i ../ECM-qmake-Qt5.12.1.patch
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_HTML_DOCS=OFF \
    -DBUILD_QTHELP_DOCS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
