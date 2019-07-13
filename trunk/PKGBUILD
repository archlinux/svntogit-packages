# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=extra-cmake-modules
pkgver=5.60.0
pkgrel=1
pkgdesc='Extra modules and scripts for CMake'
arch=(any)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(cmake)
makedepends=(python-sphinx python-requests qt5-tools)
groups=(kf5)
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz"{,.sig}
        ECM-no-init.py.patch)
sha256sums=('2bd9da815de98d5908d3371815df963d305c828f90ba1a076f38543876690248'
            'SKIP'
            '5695e45c7621a00c0bca28f058c13b5d524f963a00b53337c8cefcdaf22c4b52')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
  sed -e 's|/usr/bin/env python|/usr/bin/env python2|' -i find-modules/*.py
# Don't create __init__.py
  patch -p1 -i ../ECM-no-init.py.patch
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
