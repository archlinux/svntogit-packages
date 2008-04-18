# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=ddd
pkgver=3.3.11
pkgrel=3
pkgdesc="A graphical front-end for command-line debuggers such as GDB, JDB, pydb, perl debugger..."
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/ddd/"
license=('GPL' 'LGPL')
depends=('ncurses' 'lesstif' 'libxaw' 'libelf' 'libxext')
install=$pkgname.install
source=(http://ftp.gnu.org/gnu/ddd/$pkgname-$pkgver.tar.gz)
md5sums=('f19437ebfdb5f2667d6de30f700dd319')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
