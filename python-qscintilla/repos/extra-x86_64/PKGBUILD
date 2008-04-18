# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=python-qscintilla
pkgver=2.1
pkgrel=2
pkgdesc="Python bindings for QScintilla2"
arch=('i686' 'x86_64')
url="http://www.riverbankcomputing.co.uk/qscintilla/index.php"
license=('GPL')
depends=('pyqt>=4.3.1' 'qscintilla>=2.1')
conflicts=('python-qscintilla2')
replaces=('python-qscintilla2')
source=(http://www.riverbankcomputing.com/Downloads/Snapshots/QScintilla2/QScintilla-1.73-gpl-$pkgver.tar.gz)
md5sums=('13049717628391ca4db43f7ede0eeeb4')
sha1sums=('ca9ac61cc3d537d7b53202ff5d8565365c3f8734')

build() {
  cd $startdir/src/QScintilla-1.73-gpl-$pkgver/Python
  python configure.py || return 1
  make || return 1
  make DESTDIR=$startdir/pkg install
}
