# $Id$
# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>

pkgname=gnumeric
pkgver=1.8.2
pkgrel=1
pkgdesc="A GNOME Spreadsheet Program"
url="http://www.gnome.org/projects/gnumeric/"
arch=(i686 x86_64)
license=('GPL')
depends=('goffice>=0.6.1')
makedepends=('perlxml' 'pygtk' 'psiconv' 'pkgconfig')
install=gnumeric.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/1.8/${pkgname}-${pkgver}.tar.bz2)
options=('libtool')
md5sums=('f60edc6ca42daa2fb3717f3c90fa8a6e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
              --without-guile --with-bonobo --enable-ssindex
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
