# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>
# Contributor: Suzy Williams <suzanne.williams3@verizon.net>

pkgname=xfce4-mailwatch-plugin
pkgver=1.0.1
pkgrel=5
pkgdesc="A mailbox watch/check plugin for the Xfce4 panel"
arch=(i686 x86_64)
license=('GPL2')
url="http://xfce.org/"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('pkgconfig')
options=('!libtool')
install=${pkgname}.install
source=(http://spuriousinterrupt.org/files/mailwatch/${pkgname}-${pkgver}.tar.bz2)
md5sums=('6b21d2c98c9ba5a35a847a932c5317e0')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
