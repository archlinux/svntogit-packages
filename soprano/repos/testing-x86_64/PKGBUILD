# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=soprano
pkgver=2.0.3
pkgrel=1
pkgdesc="Soprano is a library which provides a QT wrapper API to different RDF storage solutions."
arch=('i686' 'x86_64')
url="http://soprano.sourceforge.net/"
license=('GPL2')
depends=('qt>=4.3.2' 'clucene' 'redland')
makedepends=('cmake' 'pkgconfig')
# svn snapshot: svn co svn://anonsvn.kde.org/home/kde/trunk/kdesupport/soprano
source=(http://surfnet.dl.sourceforge.net/sourceforge/soprano/$pkgname-$pkgver.tar.bz2
	#ftp://ftp.archlinux.org/other/soprano/$pkgname-$pkgver.tar.bz2
	)
options=(!libtool)

build() {
  # start building
  cd $startdir/src/$pkgname-$pkgver

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make VERBOSE=1 || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('3f33799c6ebd03048621057d268fb62f')
