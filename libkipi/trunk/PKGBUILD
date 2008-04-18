# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libkipi
pkgver=0.1.5
pkgrel=1
pkgdesc="library for kipi-plugins"
arch=(i686 x86_64)
url="http://digikam.sourceforge.net"
depends=('kdelibs')
source=(http://heanet.dl.sourceforge.net/sourceforge/kipi/$pkgname-$pkgver.tar.bz2)

build() {
  cd $startdir/src/$pkgname-$pkgver
  #cd $startdir/src/$pkgname-$pkgver/libkipi/libkipi
  #sed -i -e 's#libkipi/##g' *.cpp 
  #sed -i -e 's#libkipi/##g' *.h
  cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/opt/kde --disable-debug
   make || return 1
   make DESTDIR=$startdir/pkg/ install
   # fix pkg-config that it is in main path
   mkdir -p $startdir/pkg/usr/lib/
   mv $startdir/pkg/opt/kde/lib/pkgconfig $startdir/pkg/usr/lib/
 }
md5sums=('aef790871583444cd81bd9dea9c3fd0b')
