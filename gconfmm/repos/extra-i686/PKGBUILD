#$Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>

pkgname=gconfmm
pkgver=2.22.0
pkgrel=1
pkgdesc="A C++ wrapper for gconf."
arch=(i686 x86_64)
license=('LGPL')
depends=('gconf>=2.22.0' 'glibmm>=2.16.0')
makedepends=('pkgconfig' 'gtkmm>=2.12.5')
options=('!libtool')
url="http://gtkmm.sourceforge.net/"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('4090b7333a928c6baeff583a9a0b2b55')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
