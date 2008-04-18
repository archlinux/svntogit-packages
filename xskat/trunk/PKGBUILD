# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=xskat
pkgver=4.0
pkgrel=2
pkgdesc="XSkat lets you play the card game Skat as defined by the official Skat Order on any Un*x machine running X11"
depends=('libx11')
source=(http://www.xskat.de/$pkgname-$pkgver.tar.gz)
url="http://www.xskat.de/xskat.html"

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make BINDIR=$startdir/pkg/usr/bin install
}
