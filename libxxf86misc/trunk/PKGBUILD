# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libxxf86misc
pkgver=1.0.1
pkgrel=1
pkgdesc="X11 XFree86 miscellaneous extension library"
url="http://xorg.freedesktop.org/"
depends=(libxext xf86miscproto)
makedepends=(pkgconfig)
options=(NOLIBTOOL)
source=(${url}/releases/individual/lib/libXxf86misc-${pkgver}.tar.bz2)
md5sums=(7cee0df63903cef7f7a3fb68cdd99eef)

build() {
  cd ${startdir}/src/libXxf86misc-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

