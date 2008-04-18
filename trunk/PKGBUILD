# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
pkgname=pixman
pkgver=0.10.0
pkgrel=1
pkgdesc="Pixman library"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org"
license=()
depends=('glibc')
options=('!libtool')
source=(http://xorg.freedesktop.org/releases/individual/lib/${pkgname}-${pkgver}.tar.bz2)
md5sums=('fb23e17a8a0308e8fad6dc153753ba9a')

build() {
  cd "${startdir}/src/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${startdir}/pkg" install || return 1
}
