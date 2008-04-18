# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>
# Contributor: Ben Mazer <contrasutra@myrealbox.com>

pkgname=xfce4-notes-plugin
pkgver=1.6.1
pkgrel=1
pkgdesc="A notes plugin for the Xfce4 panel"
arch=(i686 x86_64)
license=('GPL2')
url="http://xfce-goodies.berlios.de/"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('pkgconfig')
options=('!libtool')
install=${pkgname}.install
source=(http://goodies.xfce.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('be2e9006e2a033c722243e4afc1cfc2a')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
