# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org.
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libxv
pkgver=1.0.4
pkgrel=1
pkgdesc="X11 Video extension library"
arch=(i686 x86_64)
license=('custom')
url="http://xorg.freedesktop.org/"
depends=('libxext' 'videoproto')
makedepends=('pkgconfig')
options=('!libtool')
source=(${url}/releases/individual/lib/libXv-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/libXv-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  install -D -m644 ${startdir}/src/libXv-${pkgver}/COPYING \
                   ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
md5sums=('723a0275227165383e967a1ca8899b52')
