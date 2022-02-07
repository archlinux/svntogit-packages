# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: delor <bartekpiech gmail com>

pkgname=qtcreator
pkgver=6.0.2
_clangver=13.0.1
pkgrel=4
pkgdesc='Lightweight, cross-platform integrated development environment'
arch=(x86_64)
url='https://www.qt.io'
license=(GPL3)
depends=(qt6-tools qt6-svg qt6-quick3d qt6-webengine qt6-serialport qt6-shadertools qt6-5compat
         clang=$_clangver clazy yaml-cpp) # syntax-highlighting
makedepends=(cmake llvm python)
options=(docs)
optdepends=('qt6-doc: integrated Qt documentation'
            'qt6-examples: welcome page examples'
            'qt6-translations: for other languages'
            'gdb: debugger'
            'cmake: cmake project support'
            'x11-ssh-askpass: ssh support'
            'git: git support'
            'mercurial: mercurial support'
            'bzr: bazaar support'
            'valgrind: analyze support'
            'perf: performer analyzer'
            'mlocate: locator filter')
source=(https://download.qt.io/official_releases/qtcreator/${pkgver%.*}/$pkgver/qt-creator-opensource-src-$pkgver.tar.xz
        QTCREATORBUG-26989.patch::https://code.qt.io/cgit/qt-creator/qt-creator.git/patch/?id=03a0ed07)
sha256sums=('3d173c1a02ce55137a23f294e1a840d7648656e97826067eb29d9df653351bfa'
            'c64ff799179828159a6fb3db4d6e0a864457e632ba4c6a6d1761245275c0c5e8')
options=(debug)

prepare() {
  patch -d qt-creator-opensource-src-$pkgver -p1 < QTCREATORBUG-26989.patch # Fix crashes in debugger
}

build() {
  cmake -B build -S qt-creator-opensource-src-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DWITH_DOCS=ON \
    -DBUILD_DEVELOPER_DOCS=ON \
    -DBUILD_QBS=OFF \
    -DQTC_CLANG_BUILDMODE_MATCH=ON
  cmake --build build
  cmake --build build --target docs
}

package() {
  DESTDIR="$pkgdir" cmake --install build
# Install docs
  cp -r build/share/doc "$pkgdir"/usr/share

  install -Dm644 qt-creator-opensource-src-$pkgver/LICENSE.GPL3-EXCEPT "$pkgdir"/usr/share/licenses/qtcreator/LICENSE.GPL3-EXCEPT
}
