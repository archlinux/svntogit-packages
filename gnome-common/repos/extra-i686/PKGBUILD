# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-common
pkgver=2.20.0
pkgrel=1
pkgdesc="Common macros for GNOME2"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.20/${pkgname}-${pkgver}.tar.bz2)
md5sums=('89e47677fb72695c75d2cefac84ff9f1')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}

