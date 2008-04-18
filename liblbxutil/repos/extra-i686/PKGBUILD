# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=liblbxutil
pkgver=1.0.1
pkgrel=1
pkgdesc="Low Bandwidth X11 Utility Library"
arch=(i686)
url="http://xorg.freedesktop.org/"
depends=('zlib')
makedepends=('pkgconfig')
options=(NOLIBTOOL)
source=(${url}/releases/individual/lib/${pkgname}-${pkgver}.tar.bz2)
md5sums=(b73cbd5bc3cd268722a624a5f1318fde)

build() {
  cd ${startdir}/src/${pkgname}-$pkgver
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

