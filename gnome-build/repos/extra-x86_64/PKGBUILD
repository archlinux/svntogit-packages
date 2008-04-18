# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-build
pkgver=0.2.0
pkgrel=1
pkgdesc="Gnome build framework"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gdl>=0.7.7')
makedepends=('pkgconfig')
options=('!libtool' '!makeflags')
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/0.2/${pkgname}-${pkgver}.tar.bz2)
md5sums=('97ba7c81f47c39b191d9aae9ea173084')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
