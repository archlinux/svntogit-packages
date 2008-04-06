# $Id: PKGBUILD,v 1.16 2007/12/03 09:21:04 tobias Exp $
# Maintainer: aurelien <aurelien@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=xfce4-clipman-plugin
pkgver=0.8.0
pkgrel=4
pkgdesc="A clipboard plugin for the Xfce4 panel"
arch=(i686 x86_64)
license=('custom')
url="http://xfce-goodies.berlios.de/"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://goodies.xfce.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('808d4e8bc6e9a9d4ed30124fb2236c1d')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -Dm644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
