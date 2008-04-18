# $Id$
# Contributer: Jason Chu <jchu@xentac.net>
# Maintainer: dorphell <dorphell@archlinux.org>

pkgname=openal
pkgver=0.0.8
pkgrel=4
force=y
pkgdesc="OpenAL audio library for use with opengl"
arch=('i686' 'x86_64')
url="http://www.openal.org/"
license="LGPL"
depends=('glibc')
makedepends=('cvs' 'alsa-lib' 'sdl' 'pkgconfig')
options=('!libtool')
source=(http://www.openal.org/openal_webstf/downloads/${pkgname}-${pkgver}.tar.gz
	openal-c++.patch)
md5sums=('641cf53761f35ee979f3e888614797a0' 'aadaa32edb85c3ea3cc99aa1d3cd7089')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/openal-c++.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --enable-alsa --enable-alsa-dlopen \
	      --enable-sdl --enable-sdl-dlopen
  make || return 1
  make DESTDIR=${startdir}/pkg/ install

  sed -i -e 's/@requirements@//' ${startdir}/pkg/usr/lib/pkgconfig/openal.pc || return 1
}
