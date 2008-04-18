# $Id$
# Jan de Groot <jgc@archlinux.org>

pkgname=gnome-pilot
pkgver=2.0.16
pkgrel=1
pkgdesc="Pilot Support for Gnome"
arch=(i686 x86_64)
license=('GPL')
depends=('gnome-panel>=2.22.0' 'pilot-link>=0.12.3')
makedepends=('pkgconfig' 'perlxml' 'gob2' 'gnome-doc-utils>=0.12.2')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
install=gnome-pilot.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.0/${pkgname}-${pkgver}.tar.bz2)
md5sums=('f14e87d89902f82981f106c8df9277c9')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/gnome-pilot \
              --localstatedir=/var --disable-static \
	      --disable-scrollkeeper || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
