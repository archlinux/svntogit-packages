# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libxfontcache
pkgver=1.0.4
pkgrel=1
pkgdesc="X11 font cache library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxext' 'fontcacheproto')
makedepends=('pkgconfig')
options=('!libtool')
source=(${url}/releases/individual/lib/libXfontcache-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/libXfontcache-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('1adca018aa7bf2d215f20a69c10828ad')
