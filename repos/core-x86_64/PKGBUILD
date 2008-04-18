# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>

pkgname=psmisc
pkgver=22.6
pkgrel=1
pkgdesc="Miscellaneous procfs tools"
arch=('i686' 'x86_64')
url="http://psmisc.sourceforge.net"
license=('GPL')
groups=('base')
depends=('glibc' 'ncurses')
source=(http://downloads.sourceforge.net/psmisc/$pkgname-$pkgver.tar.gz)
md5sums=('2e81938855cf5cc38856bd4a31d79a4c')
sha1sums=('cb15c23e9cfe618e9de5f066525bce7dc7b77421')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
# we use sysvinit's pidof program
  rm -f $startdir/pkg/usr/man/man1/pidof.1
  rm -f $startdir/pkg/usr/bin/pidof
}
