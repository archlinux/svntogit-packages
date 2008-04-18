# $Id$
# Contributor: herb  <herb@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=planner
pkgver=0.14.2
pkgrel=2
pkgdesc="Gnome Project Management System"
arch=(i686 x86_64)
license=('GPL')
url="http://live.gnome.org/Planner"
depends=('libgnomeprintui>=2.18.0' 'libgnomeui>=2.18.1-2' 'evolution-data-server>=1.10.1-2' 'libxslt' 'scrollkeeper' 'desktop-file-utils')
makedepends=('pkgconfig' 'perlxml' 'gnome-doc-utils>=0.10.3')
conflicts=('mrproject' 'libmrproject')
replaces=('mrproject' 'libmrproject' )
options=('nolibtool')
install=planner.install
source=(http://ftp.gnome.org/pub/GNOME/sources/planner/0.14/planner-${pkgver}.tar.bz2)
md5sums=('d03081c6562a94b64628689500f55195')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-update-mimedb \
              --enable-python --enable-eds \
	      --disable-scrollkeeper
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install
  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas  
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas  
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
