# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=netris
pkgver=0.52
pkgrel=1
pkgdesc="This is an unfinished developmental version of Netris, a free networked version of T*tris"
depends=('ncurses')
source=(ftp://ftp.netris.org/pub/netris/$pkgname-$pkgver.tar.gz)
url="http://www.netris.org/"
build() {
cd $startdir/src/$pkgname-$pkgver
./Configure -O4
make || return 1
mkdir -p $startdir/pkg/usr/bin
cp netris $startdir/pkg/usr/bin
}
