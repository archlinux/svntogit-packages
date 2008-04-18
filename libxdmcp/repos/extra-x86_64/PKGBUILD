# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libxdmcp
pkgver=1.0.2
pkgrel=1
pkgdesc="X11 Display Manager Control Protocol library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('xproto' 'glibc')
makedepends=('pkgconfig')
options=('nolibtool')
source=(${url}/releases/individual/lib/libXdmcp-${pkgver}.tar.bz2)
md5sums=('10facf2bc7cbd5e5c1a698b8a210a582')

build() {
  cd ${startdir}/src/libXdmcp-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --host=${CHOST} --build=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
