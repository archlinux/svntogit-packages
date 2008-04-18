# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=eigen
pkgver=1.0.5.svn744389
pkgrel=1
pkgdesc="Eigen is a lightweight C++ template library for vector and matrix math, a.k.a. linear algebra."
arch=('i686' 'x86_64')
url="http://eigen.tuxfamily.org/"
license=('GPL2')
depends=()
makedepends=('cmake' 'pkgconfig')
# svn snapshot: svn co svn://anonsvn.kde.org/home/kde/trunk/kdesupport/eigen
source=(ftp://ftp.archlinux.org/other/eigen/$pkgname-$pkgver.tar.bz2
	#http://kent.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2
	)
options=(!libtool)

build() {
  # start building
  cd $startdir/src/$pkgname

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release

  make VERBOSE=1 || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('a251dd5cea6067738b09667b8b6bf760')
