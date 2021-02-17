# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: delor <bartekpiech gmail com>

pkgname=qtcreator
pkgver=4.14.0
_clangver=11.1.0
pkgrel=5
pkgdesc='Lightweight, cross-platform integrated development environment'
arch=(x86_64)
url='https://www.qt.io'
license=(LGPL)
depends=(qt5-tools qt5-quickcontrols qt5-quickcontrols2 qt5-webengine qt5-svg qt5-quick3d qt5-serialport
         clang=$_clangver clazy syntax-highlighting yaml-cpp)
makedepends=(cmake llvm python)
options=(docs)
optdepends=('qt5-doc: integrated Qt documentation'
            'qt5-examples: welcome page examples'
            'qt5-translations: for other languages'
            'gdb: debugger'
            'cmake: cmake project support'
            'qbs: QBS project support'
            'x11-ssh-askpass: ssh support'
            'git: git support'
            'mercurial: mercurial support'
            'bzr: bazaar support'
            'valgrind: analyze support'
            'perf: performer analyzer')
source=("https://download.qt.io/official_releases/qtcreator/${pkgver%.*}/$pkgver/qt-creator-opensource-src-$pkgver.tar.xz"
         qtcreator-fix-clang-paths.patch::"https://code.qt.io/cgit/qt-creator/qt-creator.git/patch/?id=86348d56")
sha256sums=('d240109351e96446ff149cbd56341ec02ba37bfa50462a85e4d02dfe6b21201e'
            '99518ed7e9525bba7a8f49111c948b56fae224298f06d7dc93bb905bbcd87de4')

prepare() {
  cd qt-creator-opensource-src-$pkgver

# use system qbs
  rm -r src/shared/qbs
# Fix linking to clang
  sed -e 's|clangFormat|clang-cpp|' -i src/plugins/clangformat/CMakeLists.txt  
# Fix libexec path
  sed -e 's|libexec/qtcreator|lib/qtcreator|' -i cmake/QtCreatorAPIInternal.cmake
# Fix clang include path
  patch -p1 -i ../qtcreator-fix-clang-paths.patch
}

build() {
  cmake -B build -S qt-creator-opensource-src-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DWITH_DOCS=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 qt-creator-opensource-src-$pkgver/LICENSE.GPL3-EXCEPT "$pkgdir"/usr/share/licenses/qtcreator/LICENSE.GPL3-EXCEPT
}
