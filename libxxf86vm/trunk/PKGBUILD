# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libxxf86vm
pkgver=1.0.1
pkgrel=1
pkgdesc="X11 XFree86 video mode extension library"
url="http://xorg.freedesktop.org/"
depends=(libxext xf86vidmodeproto)
makedepends=(pkgconfig)
options=(NOLIBTOOL)
source=(${url}/releases/individual/lib/libXxf86vm-${pkgver}.tar.bz2)
md5sums=(8de1ca6c55aaad7d8cae19b4f0b3da32)

build() {
  cd ${startdir}/src/libXxf86vm-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

