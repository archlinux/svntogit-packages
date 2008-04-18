# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libpthread-stubs
pkgver=0.1
pkgrel=1
pkgdesc="pthread stubs needed by libxcb"
arch=(i686 x86_64)
url="http://xcb.freedesktop.org/"
makedepends=('pkgconfig' 'kernel-headers' 'glibc')
options=('nolibtool')
source=(${url}/dist/${pkgname}-${pkgver}.tar.bz2)
md5sums=('774eabaf33440d534efe108ef9130a7d')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --build=${CHOST} --host=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
