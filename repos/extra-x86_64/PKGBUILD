# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libxcursor
pkgver=1.1.9
pkgrel=1
pkgdesc="X cursor management library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('libxfixes' 'libxrender')
makedepends=('pkgconfig')
options=('!libtool')
source=(${url}/releases/individual/lib/libXcursor-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/libXcursor-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('99b7554037a92b260891091e81815a0a')
