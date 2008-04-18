# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libxtst
pkgver=1.0.3
pkgrel=1
pkgdesc="X11 Testing -- Resource extension library"
arch=(i686 x86_64)
options=('!libtool')
url="http://xorg.freedesktop.org/"
depends=('libxext' 'recordproto')
makedepends=('pkgconfig')
source=(${url}/releases/individual/lib/libXtst-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/libXtst-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

md5sums=('090c1ad04e34982eada5cf3b1a0792fd')
