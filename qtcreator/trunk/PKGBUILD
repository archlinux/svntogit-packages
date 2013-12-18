# $Id: PKGBUILD 101820 2013-12-02 00:06:01Z svenstaro $
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: delor <bartekpiech gmail com>

pkgname=qtcreator
pkgver=3.0.0
_pkgver=3.0.0
pkgrel=2
pkgdesc='Lightweight, cross-platform integrated development environment'
arch=('i686' 'x86_64')
url='http://qt-project.org'
license=('LGPL')
depends=('qt5-quick1' 'qt5-tools' 'qt5-quickcontrols')
makedepends=('git' 'mesa')
options=('docs')
optdepends=('qt5-doc: for the integrated Qt documentation'
            'gdb: for the debugger'
            'cmake: for cmake project support'
            'openssh-askpass: for ssh support'
            'git: for git support'
            'mercurial: for mercurial support'
            'bzr: for bazaar support'
            'valgrind: for analyze support')
install=qtcreator.install
source=("git://gitorious.org/qt-creator/qt-creator.git#tag=v${_pkgver}"
        "git://gitorious.org/qt-labs/qbs.git"
        'qtcreator.desktop')
md5sums=('SKIP'
         'SKIP'
         '82888d4be900e7833d768050a135cd37')

prepare() {
    cd qt-creator
    git submodule init
    git config submodule.qbs.url $srcdir/qbs
    git submodule update
}

build() {
  [[ -d build ]] && rm -r build
  mkdir build && cd build

  qmake ../qt-creator/qtcreator.pro
  make
  make docs -j1
}

package() {
  cd build

  make INSTALL_ROOT="${pkgdir}/usr/" install
  make INSTALL_ROOT="${pkgdir}/usr/" install_docs

  install -Dm644 ${srcdir}/qtcreator.desktop ${pkgdir}/usr/share/applications/qtcreator.desktop
  install -Dm644 ${srcdir}/qt-creator/LGPL_EXCEPTION.TXT ${pkgdir}/usr/share/licenses/qtcreator/LGPL_EXCEPTION.TXT
}
