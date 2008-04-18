# $Id$
# Maintainer: damir <damir@archlinux.org>
# Committer: Manolis Tzanidakis <manolis@archlinux.org>

pkgname=kkbswitch
pkgver=1.4.3
pkgrel=2
pkgdesc="A keyboard layout indicator for KDE."
arch=(i686 x86_64)
url="http://kkbswitch.sourceforge.net"
depends=('kdebase')
source=(http://heanet.dl.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
  sed -i '17i#include <unistd.h>'  kkbswitch/kbconfig.cpp || return 1
  ./configure --prefix=/opt/kde --disable-debug
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}
