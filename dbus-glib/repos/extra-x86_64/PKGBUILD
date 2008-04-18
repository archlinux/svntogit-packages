# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=dbus-glib
pkgver=0.74
pkgrel=1
pkgdesc="GLib bindings for DBUS"
arch=(i686 x86_64)
license=('GPL')
url="http://www.freedesktop.org/wiki/Software/DBusBindings"
depends=('dbus>=1.0.2-4' 'glib2>=2.12.9')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://dbus.freedesktop.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('0923d825a0aff2e4eb23338b630286fb')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-static=no
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
