# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>
pkgname=sdl
pkgver=1.2.13
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard"
arch=(i686 x86_64)
license=('LGPL')
depends=('glibc' 'libxext' 'libxrender' 'libx11')
options=('!libtool')
makedepends=('alsa-lib' 'esd' 'mesa')
source=(http://www.libsdl.org/release/SDL-${pkgver}.tar.gz)
url="http://www.libsdl.org"
md5sums=('c6660feea2a6834de10bc71b2f8e4d88')

build() {
  cd ${startdir}/src/SDL-${pkgver}
  ./configure --prefix=/usr --disable-nasm --enable-alsa --enable-esd --with-x
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
