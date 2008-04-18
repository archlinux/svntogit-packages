# $Id$
# Maintainer : Tobias Powalowski <tpowa@archlinux.org>

pkgname=kiosktool
pkgver=1.0
pkgrel=2
pkgdesc="A Point&Click tool for system administrators to enable KDE's KIOSK features or otherwise preconfigure KDE for groups of users"
arch=(i686 x86_64)
url="http://extragear.kde.org/apps/kiosktool.php"
depends=('kdelibs')
source=(ftp://ftp.kde.org/pub/kde/stable/apps/KDE3.x/admin/$pkgname-$pkgver.tar.bz2)

build() {
  cd $startdir/src/$pkgname-$pkgver
   ./configure --prefix=/opt/kde --enable-final
   make || return 1
   make DESTDIR=$startdir/pkg/ install
}
md5sums=('1576cdaa3cff93255fd5d7f6835b07e2')
