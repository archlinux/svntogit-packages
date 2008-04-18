# $Id$
# Maintainer: Alexander Baldeck<alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libxft
pkgver=2.1.12
pkgrel=1
pkgdesc="FreeType-based font drawing library for X"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
depends=('fontconfig' 'libxrender')
makedepends=('pkgconfig')
options=('nolibtool')
source=(${url}/releases/individual/lib/libXft-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/libXft-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
md5sums=('1309301e2d979bd475dc58325cb8c056')
