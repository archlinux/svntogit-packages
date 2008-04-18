# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=freetype2
pkgver=2.3.5
pkgrel=1
pkgdesc="TrueType font rendering library"
arch=(i686 x86_64)
license=('GPL')
url="http://freetype.sourceforge.net"
depends=('zlib')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/freetype/freetype-${pkgver}.tar.bz2
	bytecode.patch
	freetype-2.3.0-enable-spr.patch
	freetype-2.2.1-enable-valid.patch
	freetype-2.2.1-memcpy-fix.patch)
md5sums=('65234327c5ac46ee00ebda15995d4c1c'
         '9ff19e742968c29e3ba52b08d6bf0a50'
         '816dc8619a6904a7385769433c0a8653'
         '214119610444c9b02766ccee5e220680'
         '6fb6606d28082ecb8e0c6d986b0b26aa')

build() {
  cd ${startdir}/src/freetype-${pkgver}
  patch -Np0 -i ${startdir}/src/bytecode.patch || return 1
  patch -Np1 -i ${startdir}/src/freetype-2.3.0-enable-spr.patch || return 1
  patch -Np1 -i ${startdir}/src/freetype-2.2.1-enable-valid.patch || return 1
  patch -Np1 -i ${startdir}/src/freetype-2.2.1-memcpy-fix.patch || return 1

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
