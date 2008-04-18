# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>

force=y
pkgname=libgnomedb
pkgver=1.2.2
pkgrel=6
pkgdesc="Database Widget Library for Gnome"
arch=(i686 x86_64)
license=('GPL')
options=('nolibtool')
depends=('libgda>=1.2.4' 'gtksourceview>=1.8.5-2' 'libgnomeui>=2.18.1-2' 'scrollkeeper')
makedepends=('pkgconfig')
install=libgnomedb.install
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/1.2/${pkgname}-${pkgver}.tar.bz2)
md5sums=('cf8b1eb3aa3e7b18f46bc9bc9335dca7')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  find . -name Makefile.in -exec sed -i -e 's/-scrollkeeper-update.*//' {} \;

  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
