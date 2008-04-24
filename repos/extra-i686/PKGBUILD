# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-terminal
pkgver=2.22.1
pkgrel=1
pkgdesc="The GNOME Terminal Emulator"
arch=(i686 x86_64)
license=('GPL')
depends=('libgnomeui>=2.22.1' 'vte>=0.16.13' 'startup-notification>=0.9')
makedepends=('perlxml' 'pkgconfig' 'gnome-doc-utils>=0.12.2') 
options=('!emptydirs')
url="http://www.gnome.org"
groups=('gnome-extra')
install=gnome-terminal.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('0e6c71def04b2a56e8d6725cef7950b4')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1
  
  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
