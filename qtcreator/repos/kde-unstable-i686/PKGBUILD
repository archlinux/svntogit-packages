# $Id: PKGBUILD 101820 2013-12-02 00:06:01Z svenstaro $
# Maintainer: Imanol Celaya <ornitorrincos@archlinux-es.org>
# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dan Vratil <progdan@progdansoft.com>
# Contributor: thotypous <matiasΘarchlinux-br·org>
# Contributor: delor <bartekpiech gmail com>

pkgname=qtcreator
pkgver=3.0.0rc1
_pkgver=3.0.0-rc1
pkgrel=1
pkgdesc='Lightweight, cross-platform integrated development environment'
arch=('i686' 'x86_64')
url='http://qt-project.org'
license=('LGPL')
depends=('qt5-quick1' 'qt5-tools')
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
source=("http://download.qt-project.org/development_releases/qtcreator/3.0/${_pkgver}/qt-creator-opensource-src-${_pkgver}.tar.gz"
        'qtcreator.desktop')
md5sums=('50f3d001655092474440290e0cfad1de'
         '82888d4be900e7833d768050a135cd37')

build() {
  [[ -d build ]] && rm -r build
  mkdir build && cd build

  qmake ../qt-creator-opensource-src-${_pkgver}/qtcreator.pro
  make
  make docs -j1
}

package() {
  cd build

  make INSTALL_ROOT="${pkgdir}/usr/" install
  make INSTALL_ROOT="${pkgdir}/usr/" install_docs

  install -Dm644 ${srcdir}/qtcreator.desktop ${pkgdir}/usr/share/applications/qtcreator.desktop
  install -Dm644 ${srcdir}/qt-creator-opensource-src-${_pkgver}/LGPL_EXCEPTION.TXT ${pkgdir}/usr/share/licenses/qtcreator/LGPL_EXCEPTION.TXT
}
