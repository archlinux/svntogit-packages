# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=atk
pkgver=1.22.0
pkgrel=1
pkgdesc="A library providing a set of interfaces for accessibility"
arch=(i686 x86_64)
license=('LGPL')
depends=('glib2>=2.16.0')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/1.22/${pkgname}-${pkgver}.tar.bz2)
url='http://www.gtk.org/'
md5sums=('06a2b39a22d5ca35c47435da6b9643ac')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
