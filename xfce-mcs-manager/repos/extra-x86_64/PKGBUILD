# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>

pkgname=xfce-mcs-manager
pkgver=4.4.2
pkgrel=1
pkgdesc="A multi channel settings manager for Xfce"
arch=(i686 x86_64)
license=('LGPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=('libxfcegui4>=4.4.2' 'libxfce4mcs>=4.4.2')
makedepends=('pkgconfig')
options=('!libtool')
install=${pkgname}.install
source=(http://www.xfce.org/archive/xfce-${pkgver}/src/${pkgname}-${pkgver}.tar.bz2)
md5sums=('876a4b5d582de8fdc01457df2e7e1339')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
