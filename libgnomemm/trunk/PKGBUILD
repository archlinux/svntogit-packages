# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>

pkgname=libgnomemm
pkgver=2.22.0
pkgrel=1
pkgdesc="C++ bindings for libgnome."
arch=(i686 x86_64)
license=('LGPL')
depends=('libgnome>=2.22.0' 'gtkmm>=2.12.5')
makedepends=('pkgconfig')
options=('!libtool')
url="http://gtkmm.sourceforge.net/"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('a07209b2cfbc630f8c4d46b6a6f1db32')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
