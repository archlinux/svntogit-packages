# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>
# Contributor: Tobias Kieslich <tobias (at) archlinux.org>

pkgname=xfce4-genmon-plugin
pkgver=3.1
pkgrel=4
pkgdesc="plugin that monitors customizable programs stdout for the Xfce4 panel"
arch=(i686 x86_64)
license=('LGPL2')
url="http://xfce-goodies.berlios.de/"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://goodies.xfce.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('b9d44aaf1d2d3da7e2cceb80fb486f4b')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
