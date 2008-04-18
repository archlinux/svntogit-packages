# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libxaw
pkgver=1.0.4
pkgrel=1
pkgdesc="X11 Athena Widget library"
arch=(i686 x86_64)
license=('custom:')
url="http://xorg.freedesktop.org/"
depends=('libxmu' 'libxpm' 'libxp')
makedepends=('pkgconfig')
options=('!libtool')
source=(${url}/releases/individual/lib/libXaw-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/libXaw-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  mkdir -p ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 ${startdir}/src/libXaw-${pkgver}/COPYING \
                ${startdir}/pkg/usr/share/licenses/${pkgname}/license.txt
}
md5sums=('73671d8f1cf36fdd81395328cc3539c9')
