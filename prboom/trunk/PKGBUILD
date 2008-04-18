# $Id$
# Maintainer: dale <dale@archlinux.org>

pkgname=prboom
pkgver=2.4.7
pkgrel=1
pkgdesc="A game engine which provides a program to play Doom levels"
arch=(i686 x86_64)
depends=('sdl_mixer' 'sdl_net' 'libpng')
url="http://prboom.sourceforge.net/"
source=(http://heanet.dl.sourceforge.net/prboom/$pkgname-$pkgver.tar.gz)
md5sums=('9942f521764d7f89df2218a456da4f02')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	sed -i "s|/games|/bin|g" $startdir/src/$pkgname-$pkgver/src/Makefile
	make || return 1
	make DESTDIR=$startdir/pkg install
}

