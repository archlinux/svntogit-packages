# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: delor <bartekpiech gmail com>

pkgname=qtcreator
pkgver=4.11.1
_clangver=9.0.1
pkgrel=1
pkgdesc='Lightweight, cross-platform integrated development environment'
arch=(x86_64)
url='https://www.qt.io'
license=(LGPL)
depends=(qt5-tools qt5-quickcontrols qt5-quickcontrols2 qt5-webengine clang=$_clangver qbs clazy syntax-highlighting desktop-file-utils)
makedepends=(llvm python patchelf)
options=(docs)
optdepends=('qt5-doc: integrated Qt documentation'
            'qt5-examples: welcome page examples'
            'qt5-translations: for other languages'
            'gdb: debugger'
            'cmake: cmake project support'
            'x11-ssh-askpass: ssh support'
            'git: git support'
            'mercurial: mercurial support'
            'bzr: bazaar support'
            'valgrind: analyze support'
            'perf: performer analyzer')
source=("https://download.qt.io/official_releases/qtcreator/${pkgver%.*}/$pkgver/qt-creator-opensource-src-$pkgver.tar.xz"
        qtcreator-preload-plugins.patch)
sha256sums=('c511f5beacadad4a37cbf7ec23c17cf28630c79998f1dc8bc7edefa9b9337924'
            'd6f979c820e2294653f4f1853af96942bf25ff9fe9450657d45ff1c7f02bbca7')

prepare() {
  mkdir -p build

  cd qt-creator-opensource-src-$pkgver
  # fix hardcoded libexec path
  sed -e 's|libexec\/qtcreator|lib\/qtcreator|g' -i qtcreator.pri
  sed -e 's|libexec|lib|g' -i src/tools/tools.pro
  # use system qbs
  rm -r src/shared/qbs
  # Preload analyzer plugins, since upstream clang doesn't link to all plugins
  # see http://code.qt.io/cgit/clang/clang.git/commit/?id=7f349701d3ea0c47be3a43e265699dddd3fd55cf
  # and https://bugs.archlinux.org/task/59492
  patch -p1 -i ../qtcreator-preload-plugins.patch
}

build() {
  cd build

  qmake LLVM_INSTALL_DIR=/usr QBS_INSTALL_DIR=/usr \
    KSYNTAXHIGHLIGHTING_LIB_DIR=/usr/lib KSYNTAXHIGHLIGHTING_INCLUDE_DIR=/usr/include/KF5/KSyntaxHighlighting \
    CONFIG+=journald QMAKE_CFLAGS_ISYSTEM=-I \
    DEFINES+=QBS_ENABLE_PROJECT_FILE_UPDATES \
    "$srcdir"/qt-creator-opensource-src-$pkgver/qtcreator.pro
  make
  make docs
}

package() {
  cd build

  make INSTALL_ROOT="$pkgdir/usr/" install
  make INSTALL_ROOT="$pkgdir/usr/" install_docs

  install -Dm644 "$srcdir"/qt-creator-opensource-src-$pkgver/LICENSE.GPL3-EXCEPT "$pkgdir"/usr/share/licenses/qtcreator/LICENSE.GPL3-EXCEPT

# Link clazy plugin explicitely
  patchelf --add-needed ClazyPlugin.so "$pkgdir"/usr/lib/qtcreator/clangbackend
}
