# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-netstatus
pkgver=2.12.1
pkgrel=5
pkgdesc="A GNOME applet that shows network status"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org"
depends=('gnome-panel>=2.22.0')
makedepends=('perlxml' 'pkgconfig' 'gnome-doc-utils>=0.12.2')
options=(!emptydirs)
groups=('gnome-extra')
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.12/${pkgname}-${pkgver}.tar.bz2)
install=gnome-netstatus.install
md5sums=('8651ca1694a6c222ae5cad6e21814d24')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/gnome-netstatus \
              --localstatedir=/var --disable-static \
	      --disable-scrollkeeper || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
