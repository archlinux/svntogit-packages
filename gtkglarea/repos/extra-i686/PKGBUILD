# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=gtkglarea
pkgver=1.2.3
pkgrel=2
pkgdesc="GTK/GL Area libraries"
depends=('glut' 'gtk')
source=(http://freeware.sgi.com/source/gtkglarea//$pkgname-$pkgver.tar.gz)
url="http://freshmeat.net/projects/gtkglarea/?topic_id=809"

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr --with-gl
	make || return 1
	make prefix=$startdir/pkg/usr install
	#libtoolslay
	find $startdir/pkg -name '*.la' -exec rm {} \;
}
md5sums=('44f6804c1a9db61393e18680c81ae602')
