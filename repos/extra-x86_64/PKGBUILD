# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-backgrounds
pkgver=2.22.0
pkgrel=1
pkgdesc="Background images and data for GNOME"
arch=(i686 x86_64)
makedepends=('perlxml')
url="http://www.gnome.org"
license=('GPL')
groups=('gnome')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('1997e020288ea6b91ed460c2c6bfc8d4')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
