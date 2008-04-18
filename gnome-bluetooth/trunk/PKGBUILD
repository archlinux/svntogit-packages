# $Id$
# Maintainer: Roman Kyrylych <roman@archlinux.org>

pkgname=gnome-bluetooth
pkgver=0.11.0
pkgrel=1.1
pkgdesc="The GNOME Bluetooth Subsystem."
arch=('i686' 'x86_64')
url="http://www.usefulinc.com/software/gnome-bluetooth/"
license=('GPL' 'LGPL')
depends=('libbtctl>=0.9.0' 'libgnomeui>=2.18.1-2' 'gconf>=2.18.0.1-4'
         'desktop-file-utils')
makedepends=('gob2' 'intltool' 'python>=2.5' 'pygtk')
options=('!libtool' '!emptydirs')
install=gnome-bluetooth.install
source=(http://ftp.gnome.org/pub/GNOME/sources/gnome-bluetooth/0.11/${pkgname}-${pkgver}.tar.bz2)
md5sums=('5447739dfd687b3b5a075df9bac092e1')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  aclocal || return 1
  automake || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  sed -e 's|^pythondir = /usr|pythondir = |' \
      -e 's|^pydir = /usr|pydir = |' \
      -i src/Makefile
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install
     
  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas \
    ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
