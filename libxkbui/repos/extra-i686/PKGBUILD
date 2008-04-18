# $Id$
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libxkbui
pkgver=1.0.2
pkgrel=1
pkgdesc="X11 keyboard UI presentation library"
url="http://xorg.freedesktop.org/"
depends=(libxt libxkbfile)
makedepends=(pkgconfig)
options=(NOLIBTOOL)
source=(${url}/releases/individual/lib/${pkgname}-${pkgver}.tar.bz2)
md5sums=(1143e456f7429e18e88f2eadb2f2b6b1)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr \
              --host=${CHOST} --build=${CHOST}
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

