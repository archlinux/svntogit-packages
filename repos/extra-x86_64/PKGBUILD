# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>

pkgname=libgnomecanvasmm
pkgver=2.22.0
pkgrel=1
pkgdesc="A C++ wrapper for libgnomecanvas."
arch=(i686 x86_64)
license=('LGPL')
depends=('gtkmm>=2.12.5' 'libgnomecanvas>=2.20.1')
makedepends=('pkgconfig')
options=('!libtool')
url="http://gtkmm.sourceforge.net/"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('d5b08af567fe1df9752fbdae980bf23c')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
