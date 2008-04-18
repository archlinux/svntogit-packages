# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>
# Contributor: Suzy Williams <suzanne.williams3@verizon.net>

pkgname=xfce4-weather-plugin
pkgver=0.6.2
pkgrel=1
pkgdesc="A weather plugin for the Xfce4 panel"
arch=(i686 x86_64)
license=('GPL2')
url="http://xfce-goodies.berlios.de/"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libxml2')
makedepends=('pkgconfig')
options=('!libtool')
install=${pkgname}.install
source=(http://goodies.xfce.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('ba89c4f384d3a32afd0b33acad021af0')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
