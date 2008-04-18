# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gconf-editor
pkgver=2.22.0
pkgrel=1
pkgdesc="Graphical gconf registry editor"
arch=(i686 x86_64)
license=('GPL')
depends=('libgnomeui>=2.22.01')
makedepends=('pkgconfig' 'perlxml' 'gnome-doc-utils>=0.12.2')
url="http://www.gnome.org"
groups=('gnome-extra')
options=(!emptydirs)
install=gconf-editor.install
source=(http://ftp.gnome.org/pub/gnome/sources/gconf-editor/2.22/gconf-editor-${pkgver}.tar.bz2)
md5sums=('7ca99aec214dd855b5de7dacc8937055')

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
