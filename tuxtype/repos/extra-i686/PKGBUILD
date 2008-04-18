# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk> and patched by orelien <aurelien.foret@wanadoo.fr>

pkgname=tuxtype
pkgver=1.0.3
pkgrel=6
pkgdesc="TuxTyping is an educational typing tutorial game starring Tux"
depends=('sdl' 'sdl_mixer' 'sdl_image' 'audiofile' 'esd' 'glibc' 'libjpeg' \
         'libogg' 'libpng' 'libvorbis')

source=(http://easynews.dl.sourceforge.net/tuxtype/$pkgname-$pkgver.tar.bz2 $pkgname-$pkgver.patch.bz2)
url="http://www.geekcomix.com/dm/tuxtype/"

build() {
  cd $startdir/src/$pkgname-$pkgver
  bzip2 -d ../$pkgname-$pkgver.patch.bz2
  patch -Np1 -i ../$pkgname-$pkgver.patch
  ./configure --prefix=/usr
  make || return 1
  make prefix=$startdir/pkg/usr install
  rm -rf $startdir/pkg/usr/tuxtype
}
