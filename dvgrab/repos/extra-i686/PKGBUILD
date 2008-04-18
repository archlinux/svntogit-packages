# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
pkgname=dvgrab
pkgver=3.1
pkgrel=1
pkgdesc="Saves audio and video data from an IEEE (FireWire) digital source"
arch=(i686 x86_64)
depends=('libdv' 'libavc1394' 'libjpeg' 'libiec61883' 'gcc-libs')
source=(http://downloads.sourceforge.net/sourceforge/kino/$pkgname-$pkgver.tar.gz)
md5sums=('1356223d2b444b824a80bce33390687d')
url="http://www.kinodv.org/"
license=('GPL')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make prefix=$startdir/pkg/usr install
}

# vim: ts=3: ft=sh
