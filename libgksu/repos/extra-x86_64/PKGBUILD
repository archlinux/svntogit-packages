# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgksu
pkgver=2.0.5
pkgrel=1
pkgdesc="gksu authorization library"
arch=(i686 x86_64)
url="http://www.nongnu.org/gksu/index.html"
license=(GPL)
depends=('gconf>=2.18.0.1-4' 'gnome-keyring>=0.8.1-2' 'libgtop>=2.14.8-2' 
         'libglade>=2.6.0' 'startup-notification>=0.9')
makedepends=('gtk-doc' 'pkgconfig')
options=('!libtool')
install=libgksu.install
source=(http://people.debian.org/~kov/gksu/${pkgname}-${pkgver}.tar.gz)
md5sums=('93f61258751eb7396721281f8f784c46')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install
  rm -f ${startdir}/pkg/usr/lib/*.a
  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
