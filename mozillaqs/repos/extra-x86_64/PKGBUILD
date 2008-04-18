# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>


pkgname=mozillaqs
pkgver=0.6
pkgrel=3
pkgdesc="Mozilla Quickstarter is a small application that runs in the KDE SystemTray."
arch=(i686 x86_64)
url="http://mozillaqs.sourceforge.net/"
depends=('kdelibs')
source=(http://switch.dl.sourceforge.net/sourceforge/mozillaqs/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/opt/kde --disable-debug
   make || return 1
   make DESTDIR=$startdir/pkg/ install
 }
md5sums=('772386be5dde0e095f919318eb5178a1')
