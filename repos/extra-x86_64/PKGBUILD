# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=libxcb
pkgver=1.1
pkgrel=1
pkgdesc="X11 client-side library"
arch=(i686 x86_64)
url="http://xcb.freedesktop.org/"
depends=('xcb-proto>=1.1' 'libxdmcp' 'libxau')
makedepends=('pkgconfig' 'libxslt' 'libpthread-stubs')
options=('!libtool')
license=('custom')
source=(${url}/dist/${pkgname}-${pkgver}.tar.bz2)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  # Remove pthread-stubs dependency from pc files,
  # the stubs package doesn't provide any libs since our libc is complete.
  sed -i -e 's/pthread-stubs//' ${startdir}/pkg/usr/lib/pkgconfig/*.pc

  install -m644 -D ${startdir}/src/${pkgname}-${pkgver}/COPYING \
                   ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
md5sums=('9310b02433273d75d42f10da3c7455aa')
