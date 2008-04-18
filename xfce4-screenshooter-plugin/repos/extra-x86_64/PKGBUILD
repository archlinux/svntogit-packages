# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>
# Contributor: Tobias Kieslich <tobias (at) archlinux.org>

pkgname=xfce4-screenshooter-plugin
pkgver=1.0.0
pkgrel=5
pkgdesc="plugin that makes screenshots for the Xfce4 panel"
arch=(i686 x86_64)
license=('custom')
url="http://xfce-goodies.berlios.de/"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://goodies.xfce.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('d12746c635eb28207161a3da1585aa75')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -Dm644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
