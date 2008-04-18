# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=sdl_image
pkgver=1.2.6
pkgrel=2
pkgdesc="A simple library to load images of various formats as SDL surfaces"
arch=(i686 x86_64)
license=('LGPL')
depends=('sdl>=1.2.13' 'libpng' 'libjpeg' 'libtiff' 'zlib')
options=('!libtool')
url="http://www.libsdl.org/projects/SDL_image/"
source=(http://www.libsdl.org/projects/SDL_image/release/SDL_image-${pkgver}.tar.gz
	SDL_image-IMG_lbm.patch
	SDL_image-buffer-overflow.patch)
md5sums=('b866dc4f647517bdaf57f6ffdefd013e'
         '81424f716513845f27e1b69459343327'
         'e774a12d1a07b788233f6c15aca05780')

build() {
  cd ${startdir}/src/SDL_image-${pkgver}
  patch -Np2 -i ${startdir}/src/SDL_image-IMG_lbm.patch || return 1
  patch -Np2 -i ${startdir}/src/SDL_image-buffer-overflow.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
