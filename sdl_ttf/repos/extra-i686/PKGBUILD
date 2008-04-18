# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=sdl_ttf
pkgver=2.0.9
pkgrel=1
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications"
arch=(i686 x86_64)
license=('LGPL')
url="http://www.libsdl.org/projects/SDL_ttf/"
depends=('sdl>=1.2.12' 'freetype2')
options=('!libtool')
source=(http://www.libsdl.org/projects/SDL_ttf/release/SDL_ttf-${pkgver}.tar.gz)

build() {
  cd ${startdir}/src/SDL_ttf-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
