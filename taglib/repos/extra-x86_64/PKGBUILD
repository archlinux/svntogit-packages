# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=taglib
pkgver=1.5
pkgrel=1
pkgdesc="library for reading and editing the meta-data of several popular audio formats."
arch=('i686' 'x86_64')
url="http://ktown.kde.org/~wheeler/taglib.html"
license=('GPL2')
depends=('zlib' 'gcc-libs')
makedepends=('cmake' 'pkgconfig')
# svn snapshot: svn co svn://anonsvn.kde.org/home/kde/trunk/kdesupport/taglib
source=(http://ktown.kde.org/~wheeler/files/src/taglib-$pkgver.tar.gz
	#ftp://ftp.archlinux.org/other/kde/$pkgname-$pkgver.tar.bz2
	#http://belnet.dl.sourceforge.net/sourceforge/soprano/soprano-1.97.1-beta4.tar.bz2
	)
options=(!libtool)

build() {
  # start building
  cd $startdir/src/$pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make VERBOSE=1 || return 1
  make DESTDIR=$startdir/pkg install || return 1
}

md5sums=('7b557dde7425c6deb7bbedd65b4f2717')
