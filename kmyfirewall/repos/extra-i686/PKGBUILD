# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=kmyfirewall
pkgver=1.0.1
pkgrel=2
pkgdesc="A (almost) complete graphical interface to the IPTables command line program that configures the fire walling functionality "
arch=(i686 x86_64)
url="http://kmyfirewall.sourceforge.net/"
depends=('kdelibs' 'iptables')
source=(http://heanet.dl.sourceforge.net/sourceforge/kmyfirewall/$pkgname-$pkgver.tar.bz2)
install=kmyfirewall.install


build() {
  cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/opt/kde --enable-final --disable-debug
   make || return 1
   make DESTDIR=$startdir/pkg/ install
 }
md5sums=('c0231b5b6f5c61adb53b04fa87a90738')
