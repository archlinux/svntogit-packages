# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=extra-cmake-modules
pkgver=5.73.0
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
sha256sums=('c5e3ef0253f7d5ab3adf9185950e34fd620a3d5baaf3bcc15892f971fc3274c4'
            'SKIP'
            '5695e45c7621a00c0bca28f058c13b5d524f963a00b53337c8cefcdaf22c4b52')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

prepare() {
  patch -d $pkgname-$pkgver -p1 -i ../ECM-no-init.py.patch # Don't create __init__.py
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_HTML_DOCS=OFF \
    -DBUILD_QTHELP_DOCS=ON \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
