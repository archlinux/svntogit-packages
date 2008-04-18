# $Id$ 
# Contributor: William Rea <sillywilly@gmail.com> , Robert Emil Berge <filoktetes@linuxophic.org>
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libopensync
pkgver=0.36
pkgrel=1
pkgdesc="Library for OpenSync Standardized Synchronization Framework"
arch=('i686' 'x86_64')
url="http://www.opensync.org"
options=('!libtool')
license="LGPL"
makedepends=('python' 'cmake')
depends=('glib2' 'libxml2' 'sqlite3')
source=(http://www.opensync.org/download/releases/0.36/libopensync-$pkgver.tar.bz2)

build() {
  # start building
  cd $startdir/src/
  mkdir build 
  cd build
  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release

  make VERBOSE=1 || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('d8cc7835663566e3626e959d8fb531bf')
