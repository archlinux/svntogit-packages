# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Jochem Kossen <j.kossen@home.nl>

pkgname=id3
pkgver=0.78
pkgrel=1
pkgdesc="Utility to edit id3v1 and id3v2 tags"
arch=('i686' 'x86_64')
license=('custom')
source=(http://home.wanadoo.nl/squell/files/$pkgname-$pkgver.tar.gz)
url="http://home.wanadoo.nl/squell/id3.html"
md5sums=('bbc2a5d8022006330e6bb51034fafb43')
sha1sums=('3858d239d17efa496a77f694a0c000d1629a3aaa')

build() {
	cd $startdir/src/$pkgname-$pkgver
	make || return 1
	make prefix=$startdir/pkg/usr install

	#install license
	mkdir -p $startdir/pkg/usr/share/licenses/$pkgname
	install COPYING $startdir/pkg/usr/share/licenses/$pkgname/
}
