# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: Kevin Piche <kevin@archlinux.org>

# SONAME change rebuild: clanlib luola sdl_perl
pkgname=sdl_gfx
pkgver=2.0.16
pkgrel=1
pkgdesc="SDL Graphic Primitives"
arch=(i686 x86_64)
license=('LGPL')
options=(!libtool)
url="http://www.ferzkopp.net/joomla/content/view/19/14/"
source=(http://www.ferzkopp.net/Software/SDL_gfx-2.0/SDL_gfx-${pkgver}.tar.gz)
depends=('sdl')
md5sums=('22dc2d9d916197829f9342c490d2d02b')

build() {
  cd ${startdir}/src/SDL_gfx-${pkgver}

  if [ "${CARCH}" == "x86_64" ]; then
    ./configure --prefix=/usr --disable-mmx
  else
    ./configure --prefix=/usr
  fi

  make || return 1
  make DESTDIR=${startdir}/pkg install
}
