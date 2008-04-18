# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=capseo
pkgver=158
pkgrel=1
pkgdesc="Capseo video codec"
arch=('i686' 'x86_64')
url="http://rm-rf.in/captury"
license=('GPL2')
depends=('libgl')
makedepends=('pkgconfig')
# svn snapshot: svn co "svn://rm-rf.in/captury/trunk" "captury"
source=(ftp://ftp.archlinux.org/other/capseo/$pkgname-$pkgver.tar.bz2)
options=(!libtool)

build() {
  # start building
  cd $startdir/src/$pkgname

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
md5sums=('c284fc8b79161b1b887479f9ec43e45e')
