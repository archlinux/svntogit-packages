# $Id$
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>
# Mantainer: Roberto Carvajal <roberto@archlinux.org>

pkgname=mjpegtools
pkgver=1.8.0
pkgrel=3
pkgdesc="The mjpeg programs are a set of tools that can do recording of videos and playback, simple cut-and-paste editing and the MPEG compression of audio and video under Linux. "
arch=(i686 x86_64)
license=('GPL')
url="http://mjpeg.sourceforge.net/"
depends=('libjpeg' 'libpng' 'sdl' 'gcc' 'libdv')
makedepends=('gtk2')
options=('!makeflags' '!libtool')
source=(http://downloads.sourceforge.net/sourceforge/mjpeg/${pkgname}-${pkgver}.tar.gz
	mjpegtools-1.8.0-gcc41.patch)
md5sums=('6fd98362310480bdaf7171e9659f165f' '803eccd889c60a442ee23ba65951fadc')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/mjpegtools-1.8.0-gcc41.patch || return 1
  ./configure --prefix=/usr
  find -name Makefile -exec sed -i -e 's:-march=k8 -mtune=k8::' -e 's:-march=pentium3 -mtune=pentium3::' {} \;

  make || return 1
  make DESTDIR=${startdir}/pkg install

  install -m644 mpeg2enc/mpeg2syntaxcodes.h \
      ${startdir}/pkg/usr/include/mjpegtools/mpeg2enc/
}
