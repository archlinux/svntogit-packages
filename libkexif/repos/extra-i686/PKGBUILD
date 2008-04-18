# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libkexif
pkgver=0.2.5
pkgrel=1
pkgdesc="library for manipulating EXIF information"
arch=(i686 x86_64)
url="http://digikam.sourceforge.net"
depends=('kdelibs' 'libexif')
source=(http://heanet.dl.sourceforge.net/sourceforge/kipi/$pkgname-$pkgver.tar.bz2)

build() {
  cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/opt/kde --disable-debug
   make || return 1
   make DESTDIR=$startdir/pkg/ install
   # fix pkg-config that it is in main path
   mkdir -p $startdir/pkg/usr/lib/
   mv $startdir/pkg/opt/kde/lib/pkgconfig $startdir/pkg/usr/lib/
 }
md5sums=('a2b933b80deabe57d8515583236ae6ff')
