# $Id: 
# Maintainer: arjan <arjan@archlinux.org>
# Contributor : Markus Meissner <markus@meissna.de>

pkgname=glhack
pkgver=1.2
pkgrel=1
pkgdesc='a 3D port of Nethack for use with OpenGL'
backup=()
url="http://glhack.sourceforge.net/"
source=(http://download.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
depends=('sdl' 'libpng' 'mesa')

build(){
	cd $startdir/src/$pkgname-$pkgver
	sed -i -e 's|GAMEDIR  = $(PREFIX)/lib/games/$(GAME)|GAMEDIR  = $(PREFIX)/share/$(GAME)|g' Makefile
	sed -i -e 's|SHELLDIR = $(PREFIX)/games|SHELLDIR = $(PREFIX)/bin|g' Makefile
	sed -i -e 's|MANDIR   = $(PREFIX)/share/man|MANDIR   = $(PREFIX)/man|g' Makefile
	sed -i -e 's|VARDIR   = /var/lib/games/glhack|VARDIR   = $(PREFIX)/share/$(GAME)|g' Makefile
	sed -i -e 's|GAMEGRP  = games|GAMEGRP  = users|g' Makefile
	mkdir -p $startdir/pkg/usr/man/man6
	make || return 1
	sed -i -e 's|PREFIX[\t]* = /usr|PREFIX   = '$startdir'/pkg/usr|g' Makefile
	sed -i -e 's|s;/usr/games/lib/nethackdir;$(GAMEDIR);|s;/usr/games/lib/nethackdir;/usr/share/$(GAME);|g' Makefile
	make install
}
