# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=xchat-gnome
pkgver=0.18
pkgrel=2
pkgdesc="GNOME frontend to the popular X-Chat IRC client."
arch=('i686' 'x86_64')
license=('GPL')
url="http://xchat-gnome.navi.cx/"
depends=('libgnomeui>=2.18.1-2' 'libsexy>=0.1.11' 'gconf>=2.18.0.1-4'
         'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('gettext' 'perlxml' 'python' 'tcl' 'libnotify' 'gnome-doc-utils>=0.10.3')
install=xchat-gnome.install
source=(http://releases.navi.cx/${pkgname}/${pkgname}-${pkgver}.tar.bz2
	tcl-plugin.patch it.po.patch)
md5sums=('4976cd34a0e9115c800b5d317e121182'
         'accd91263965d9202b356a9fa53d733e'
         '89a041a01f7039440b0af1c013945d4c')
options=('!libtool')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ../tcl-plugin.patch || return 1
  patch -Np0 -i ../it.po.patch || return 1

  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --enable-ipv6 --enable-shm \
	      --disable-gtkfe --disable-scrollkeeper
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install
  
  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas \
    ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
