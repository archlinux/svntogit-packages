# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>

pkgname=xfce4-icon-theme
pkgver=4.4.2
pkgrel=1
pkgdesc="A set of icon themes for the Xfce window manager"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=()
makedepends=('pkgconfig')
options=('!libtool')
install=${pkgname}.install
source=(http://www.xfce.org/archive/xfce-${pkgver}/src/${pkgname}-${pkgver}.tar.bz2)
md5sums=('d3e3e64596a7efa857d2e6bb0cbd09bb')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
