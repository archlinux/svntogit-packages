# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>
# Contributor: Tobias Kieslich <tobias (at) archlinux.org>

pkgname=xfce4-xkb-plugin
pkgver=0.4.3
pkgrel=4
pkgdesc="plugin to switch keyboard layouts for the Xfce4 panel"
arch=(i686 x86_64)
license=('custom')
url="http://xfce-goodies.berlios.de/"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://goodies.xfce.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('e0375158339672f49c9e48a8b4669592')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -Dm644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
