# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>
pkgname=libglademm
pkgver=2.6.6
pkgrel=1
pkgdesc="A C++ wrapper for libglade."
arch=(i686 x86_64)
license=('LGPL')
depends=('libglade>=2.6.2' 'gtkmm>=2.12.5')
makedepends=('pkgconfig')
options=('!libtool')
url="http://gtkmm.sourceforge.net/"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.6/${pkgname}-${pkgver}.tar.bz2)
md5sums=('c4b2440d5e816ff4d692a246bce55dfb')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
