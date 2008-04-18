# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>

pkgname=xfce4-appfinder
pkgver=4.4.2
pkgrel=1
pkgdesc="Xfce application finder"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=('libxfcegui4>=4.4')
makedepends=('pkgconfig')
options=('!libtool')
install=${pkgname}.install
source=(http://www.xfce.org/archive/xfce-${pkgver}/src/${pkgname}-${pkgver}.tar.bz2)
md5sums=('0bdd0b1e96a1e1cf50ce5d582758b992')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
