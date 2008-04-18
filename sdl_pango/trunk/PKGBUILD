# $Id$
#
# Contributor: gyo <nucleogeek@gmail.com>

pkgname=sdl_pango
pkgver=0.1.2
pkgrel=1
pkgdesc="Pango SDL binding"
url="http://sdlpango.sourceforge.net/"
license=""
depends=('pango' 'sdl')
source=(http://switch.dl.sourceforge.net/sourceforge/sdlpango/SDL_Pango-$pkgver.tar.gz http://zarb.org/~gc/t/SDL_Pango-$pkgver-API-adds.patch)
md5sums=('85bbf9bb7b1cee0538154dadd045418c''5decf3d7eb724e27548af3142131a2f6')
options=(NOLIBTOOL)

build() {
	_prefixname=SDL_Pango
  cd $startdir/src/$_prefixname-$pkgver
	patch -Np0 < $startdir/$_prefixname-$pkgver-API-adds.patch
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
