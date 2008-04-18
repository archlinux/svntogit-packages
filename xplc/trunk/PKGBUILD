# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=xplc
pkgver=0.3.13
pkgrel=1
pkgdesc="Cross-Platform Lightweight Components"
arch=(i686 x86_64)
depends=('gcc')
source=(http://heanet.dl.sourceforge.net/sourceforge/xplc/$pkgname-$pkgver.tar.gz)
url="http://xplc.sourceforge.net"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --without-libuuid
  make || return 1
  make DESTDIR=$startdir/pkg install
  rm -f $startdir/pkg/usr/bin/uuidgen
  rm -f $startdir/pkg/usr/man/man1/uuidgen.1
}
