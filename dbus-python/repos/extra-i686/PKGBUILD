# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=dbus-python
pkgver=0.82.4
pkgrel=1
pkgdesc="Python bindings for DBUS"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://www.freedesktop.org/wiki/Software/DBusBindings"
depends=('dbus-glib>=0.74' 'python>=2.5')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://dbus.freedesktop.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('f491e0372128a6d1178b210a8b1a842f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
  make DESTDIR=${startdir}/pkg install
}
