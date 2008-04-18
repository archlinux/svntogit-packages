# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
#contributor Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=cdcd
pkgver=0.6.6
pkgrel=2
pkgdesc="A commandline cd-player"
depends=('libcdaudio' 'readline')
source=(http://dl.sourceforge.net/sourceforge/libcdaudio/$pkgname-$pkgver.tar.gz)
url="http://libcdaudio.sourceforge.net/"
md5sums=('dc17f2e275c7214cb693f6abb50f29fb')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make prefix=$startdir/pkg/usr install
}
