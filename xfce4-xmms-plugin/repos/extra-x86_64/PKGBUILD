# $Id$

pkgname=xfce4-xmms-plugin
pkgver=0.5.1
pkgrel=4
pkgdesc="An XMMS control plugin for the Xfce panel"
arch=(i686 x86_64)
license=('custom')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-xmms-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://goodies.xfce.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('e2e48ba8f2de32e4fd7ab09083458e3f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg/ install
  install -Dm644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
