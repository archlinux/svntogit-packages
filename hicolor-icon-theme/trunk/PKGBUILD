# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributer: Jan De Groot <jan@jgc.homeip.net>
pkgname=hicolor-icon-theme
pkgver=0.10
pkgrel=1
pkgdesc="Freedesktop.org Hicolor icon theme"
arch=(i686 x86_64)
depends=()
url="http://icon-theme.freedesktop.org/wiki/HicolorTheme"
source=(http://icon-theme.freedesktop.org/releases/${pkgname}-${pkgver}.tar.gz)
md5sums=('3534f7b8e59785c7d5bfa923e85510a7')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
