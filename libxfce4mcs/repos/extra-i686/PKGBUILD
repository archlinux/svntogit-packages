# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>

pkgname=libxfce4mcs
pkgver=4.4.2
pkgrel=1
pkgdesc="Multi-channel settings management support for Xfce"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=('libxfce4util>=4.4.2' 'startup-notification')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://www.xfce.org/archive/xfce-${pkgver}/src/${pkgname}-${pkgver}.tar.bz2)
md5sums=('5ffe66a3eeb884839806ce929e5d2776')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
