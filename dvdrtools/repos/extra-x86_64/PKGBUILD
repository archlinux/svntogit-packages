# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=dvdrtools
pkgver=0.2.1
pkgrel=2
pkgdesc="dvdrtools is a fork of cdrtools, with the primary goal of supporting writable DVD drives"
arch=(i686 x86_64)
depends=('glibc')
conflicts=('cdrkit')
source=(http://savannah.nongnu.org/download/dvdrtools/$pkgname-$pkgver.tar.gz)
url="http://www.arklinux.org/projects/dvdrtools"
md5sums=('e82d359137e716e8c0b04d5c73bd3e79')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make prefix=$startdir/pkg/usr install
}
