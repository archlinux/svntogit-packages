# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>
# Contributor: Merk Matthias <macem@chello.at>

pkgname=xfce4-sensors-plugin
pkgver=0.10.99.2
pkgrel=2
pkgdesc="A lm_sensors plugin for the Xfce panel"
arch=(i686 x86_64)
license=('GPL2')
url="http://xfce-goodies.berlios.de/"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'lm_sensors>=3.0.0')
makedepends=('pkgconfig')
options=(!libtool)
install=${pkgname}.install
source=(http://goodies.xfce.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2
	http://people.atrpms.net/~hdegoede/xfce4-sensors-plugin-0.10.99.2-lm_sensors3x.patch)
md5sums=('5646407da37c6be63476b63347d0870b'
         '9ae4ba1367bdb84b05717ffe81c153bf')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ../xfce4-sensors-plugin-0.10.99.2-lm_sensors3x.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg/ install
}
