# $Id$
# Maintainer: aurelien <aurelien@archlinux.org>
# Contributor: Tobias Kieslich <tobias (at) archlinux.org>

pkgname=xfce4-mpc-plugin
pkgver=0.3.2
pkgrel=2
pkgdesc="plugin to control the music player daemon from the xfce4-panel"
arch=(i686 x86_64)
license=('GPL2')
url="http://goodies.xfce.org/projects/panel-plugins/xfce4-mpc-plugin"
groups=('xfce4-goodies')
depends=('xfce4-panel' 'libmpd')
makedepends=('pkgconfig' 'perlxml')
options=(!libtool)
source=(http://goodies.xfce.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('a44d3ddb45cb524bf77d3522cac57286')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
