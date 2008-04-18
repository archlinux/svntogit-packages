# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=xcb-proto
pkgver=1.1
pkgrel=1
pkgdesc="XML-XCB protocol descriptions"
arch=(i686 x86_64)
url="http://xcb.freedesktop.org/"
license=('custom')
source=(${url}/dist/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  install -m644 -D ${startdir}/src/${pkgname}-${pkgver}/COPYING \
                   ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
md5sums=('dd34acc58c0a438e812f72a9afe7b2a0')
