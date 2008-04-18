# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>

pkgname=xfce-utils
pkgver=4.4.2
pkgrel=1
pkgdesc="Utilities for Xfce"
arch=(i686 x86_64)
license=('GPL2')
url="http://www.xfce.org/"
groups=('xfce4')
depends=('libxfcegui4>=4.4.2' 'libxfce4mcs>=4.4.2' 'bash' 'dbh')
makedepends=('xfce-mcs-manager>=4.4.2' 'pkgconfig')
options=('!libtool')
install=${pkgname}.install
source=(http://www.xfce.org/archive/xfce-${pkgver}/src/${pkgname}-${pkgver}.tar.bz2)
md5sums=('119dd3f1daedfa41e3be89bad8997336')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D -m644 gdm/xfce.desktop ${startdir}/pkg/etc/X11/sessions/xfce4.desktop
}
