# $Id$
# Maintainer: Kevin Piche <kevin@archlinux.org>
# Contributor: contrasutra

pkgname=emelfm2
pkgver=0.4
pkgrel=1
pkgdesc="A file manager that implements the popular two-pane design"
arch=(i686 x86_64)
url="http://emelfm2.net/"
depends=('gtk2')
license=('GPL')
source=(http://emelfm2.net/rel/${pkgname}-${pkgver}.tar.gz)
md5sums=('0242f340b642d7de2c09ccc8963e3135')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  make PREFIX=/usr
  make PREFIX=${startdir}/pkg/usr install

  install -m 755 ${startdir}/pkg/usr/share/pixmaps/emelfm2/emelfm2_48.png \
      ${startdir}/pkg/usr/share/pixmaps/emelfm2.png
  sed -e '/Icon=/ s^emelfm2/emelfm2_48.png^emelfm2.png^' \
      -e '/Categories=/ s^;$^;Application;Utility;^' \
      -i ${startdir}/pkg/usr/share/applications/emelfm2.desktop
}
