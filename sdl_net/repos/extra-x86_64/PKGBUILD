# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: dorphell <dorphell@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=sdl_net
pkgver=1.2.7
pkgrel=2
pkgdesc="A small sample cross-platform networking library"
arch=(i686 x86_64)
license=(GPL)
depends=('sdl')
options=('!libtool')
url="http://www.libsdl.org/projects/SDL_net/"
source=(http://www.libsdl.org/projects/SDL_net/release/SDL_net-${pkgver}.tar.gz)

build() {
  cd ${startdir}/src/SDL_net-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
md5sums=('6bd4662d1423810f3140d4da21b6d912')
