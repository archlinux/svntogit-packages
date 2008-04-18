# $Id$
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=sdl_sound
pkgver=1.0.1
pkgrel=7
pkgdesc="A library to decode several popular sound file formats, such as .WAV and .MP3"
arch=(i686 x86_64)
depends=('sdl' 'libmikmod' 'libvorbis' 'flac>=1.1.4' 'speex')
source=(http://icculus.org/SDL_sound/downloads/SDL_sound-$pkgver.tar.gz flac.patch)
url="http://icculus.org/SDL_sound/"

build() {
  cd $startdir/src/SDL_sound-$pkgver
  patch -Np1 -i ../flac.patch || return 1
  aclocal
  autoconf
  automake --foreign
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
  # libtoolslay
  find $startdir/pkg -name '*.la' -exec rm {} \;
}
md5sums=('49e197ef7c8ab623d0640dc74be43160' '302aa9dc94cc71dd3339ca3177d36e1c')
