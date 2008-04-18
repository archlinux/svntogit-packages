# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=jade
pkgver=1.2.1
pkgrel=4
pkgdesc="James Clark's DSSSL Engine"
arch=(i686 x86_64)
replaces='openjade'
depends=('gcc')
source=(ftp://ftp.jclark.com/pub/jade/jade-1.2.1.tar.gz \
        http://ftp.debian.org/debian/pool/main/j/jade/jade_1.2.1-45.diff.gz)
url='http://www.jclark.com/jade/'

build() {
	cd $startdir/src/$pkgname-$pkgver
	patch -p1 < ../jade_1.2.1-45.diff
	chmod u+x configure
	./configure --prefix=/usr --enable-default-catalog=/usr/share/sgml/catalog
	make || return 1
	mkdir -p $startdir/pkg/usr/lib
	make prefix=$startdir/pkg/usr install
	#libtoolslay
	find $startdir/pkg -name '*.la' -exec rm {} \;
}
md5sums=('4239670ca6b578bff68b8c2e7cd1225f' '0768ad9f9fd9bad737a421138a180406')
