# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=knetload
pkgver=2.3
pkgrel=3
pkgdesc="A small network load meter for Kicker"
arch=(i686 x86_64)
url="http://extragear.kde.org/apps/knetload.php"
depends=('kdelibs')
source=(http://flameeyes.web.ctonet.it/files/$pkgname-$pkgver.tar.bz2)

build() {
  cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/opt/kde --enable-final --disable-debug
   make || return 1
   make DESTDIR=$startdir/pkg/ install
 }
md5sums=('10d41f1177cfde19408bb20a9a174e10')
