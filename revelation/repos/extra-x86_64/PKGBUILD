# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=revelation
pkgver=0.4.11
pkgrel=3
pkgdesc="Password manager for the GNOME 2 desktop"
arch=(i686 x86_64)
license=('GPL')
depends=('gnome-python-desktop>=2.18.0' 'pycrypto>=2.0.1-2' 'gnome-panel>=2.18.1' 'cracklib' 'desktop-file-utils')
install=revelation.install
url="http://oss.codepoet.no/revelation/"
source=(ftp://oss.codepoet.no/revelation/revelation-${pkgver}.tar.bz2)
md5sums=('e2db4a2f00f59b18798d4453c778129f')

build() {
  cd ${startdir}/src/revelation-${pkgver}

  sed -i -e 's/gnome-python-extras/gnome-python-desktop/g' configure
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/revelation \
              --localstatedir=/var \
	      --disable-mime-update --disable-desktop-update
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
