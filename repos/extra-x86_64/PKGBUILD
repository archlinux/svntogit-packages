# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: delor <bartekpiech gmail com>

pkgname=qtcreator
pkgver=5.0.0
_clangver=12.0.1
pkgrel=1
pkgdesc='Lightweight, cross-platform integrated development environment'
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3)
depends=(qt6-tools qt6-quickcontrols2 qt6-svg qt6-quick3d qt6-shadertools qt6-5compat # qt6-webengine qt6-serialport
         clang=$_clangver clazy yaml-cpp)
makedepends=(cmake llvm python)
options=(docs)
optdepends=('qt6-doc: integrated Qt documentation'
            'qt6-examples: welcome page examples'
            'qt6-translations: for other languages'
            'gdb: debugger'
            'cmake: cmake project support'
            'qbs: QBS project support'
            'x11-ssh-askpass: ssh support'
            'git: git support'
            'mercurial: mercurial support'
            'bzr: bazaar support'
            'valgrind: analyze support'
            'perf: performer analyzer'
            'mlocate: locator filter')
source=(https://download.qt.io/official_releases/qtcreator/${pkgver%.*}/$pkgver/qt-creator-opensource-src-$pkgver.tar.xz)
sha256sums=('b24b194a2e96f07baf55815264cd898fa0399673bfedd500575098fdf8d70475')

build() {
  cmake -B build -S qt-creator-opensource-src-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DWITH_DOCS=ON \
    -DBUILD_DEVELOPER_DOCS=ON \
    -DBUILD_QBS=OFF
  cmake --build build
  cmake --build build --target docs
}

package() {
  DESTDIR="$pkgdir" cmake --install build
# Install docs
  cp -r build/share/doc "$pkgdir"/usr/share

  install -Dm644 qt-creator-opensource-src-$pkgver/LICENSE.GPL3-EXCEPT "$pkgdir"/usr/share/licenses/qtcreator/LICENSE.GPL3-EXCEPT
}
