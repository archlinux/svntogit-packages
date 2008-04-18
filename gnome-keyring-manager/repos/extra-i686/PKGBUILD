# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tor Krill <tor@krill.nu>

pkgname=gnome-keyring-manager
pkgver=2.20.0
pkgrel=1
pkgdesc="Password and key manager application for the GNOME Keyring"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/"
depends=('libgnomeui>=2.20.0')
makedepends=('gnome-doc-utils>=0.12.0' 'pkgconfig')
options=(!emptydirs)
install=gkm.install
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/2.20/${pkgname}-${pkgver}.tar.bz2)
md5sums=('61d701888f00c02490c0cd551bf3fcb1')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var  --disable-scrollkeeper
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
