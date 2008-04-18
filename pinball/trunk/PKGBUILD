# $Id$
# Maintainer: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=pinball
pkgver=0.3.1
pkgrel=3
pkgdesc="The Emilia Pinball Project strives to fulfil your needs for a great pinball game in Linux"
depends=('sdl' 'sdl_mixer' 'sdl_image')
url="http://pinball.sourceforge.net/"
source=(http://download.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('f28e8f49e0db8e9491e4d9f0c13c36c6')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
	chown root:users $startdir/pkg/var/games/pinball/*/highscores
	chmod 664 $startdir/pkg/var/games/pinball/*/highscores
}
