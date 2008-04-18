# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libice
pkgver=1.0.4
pkgrel=1
pkgdesc="X11 Inter-Client Exchange library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('glibc' 'xproto')
makedepends=('pkgconfig' 'xtrans')
options=('!libtool')
source=(${url}/releases/individual/lib/libICE-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/libICE-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('4ab4e67e0b8845aa201e984153087f4a')
