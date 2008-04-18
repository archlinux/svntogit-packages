# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libxext
pkgver=1.0.4
pkgrel=1
pkgdesc="X11 miscellaneous extensions library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libx11' 'xextproto')
makedepends=('pkgconfig')
options=('!libtool')
source=(${url}/releases/individual/lib/libXext-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/libXext-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('a91f1f722ac80c597cf0b75dcb8b48c0')
