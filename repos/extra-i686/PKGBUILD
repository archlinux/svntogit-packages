# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libkexiv2
pkgver=0.1.6
pkgrel=3
pkgdesc="an exiv2 library wrapper"
arch=(i686 x86_64)
license=('GPL')
url="http://kipi-plugins.sourceforge.net"
depends=('kdelibs' 'exiv2>=0.16')
source=(http://heanet.dl.sourceforge.net/sourceforge/kipi/$pkgname-$pkgver.tar.bz2)
md5sums=('8a256ac6a3895720a88b29eaf932917c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make -f admin/Makefile.common
   ./configure --prefix=/opt/kde --disable-debug
   make || return 1
   make DESTDIR=$startdir/pkg/ install
   # fix pkg-config that it is in main path
   mkdir -p $startdir/pkg/usr/lib/
   mv $startdir/pkg/opt/kde/lib/pkgconfig $startdir/pkg/usr/lib/
 }
