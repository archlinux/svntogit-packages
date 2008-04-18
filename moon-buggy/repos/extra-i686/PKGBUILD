# $Id$
# Maintainer: Dale Blount <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=moon-buggy
pkgver=1.0
pkgrel=1
pkgdesc="Moon Buggy is a simple game for the text mode"
depends=('ncurses')
url="http://seehuhn.de/comp/moon-buggy"
source=(http://seehuhn.de/data/$pkgname-$pkgver.tar.gz Makefile.in.patch)
md5sums=('4da97ea40eca686f6f8b164d8b927e38' 'deddd0d5b65235911bc9ab36b0707580')
build() {
	cd $startdir/src/$pkgname-$pkgver
	patch -p0 < $startdir/src/Makefile.in.patch
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}
