# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gedit
pkgver=2.22.1
pkgrel=1
pkgdesc="A text editor for GNOME"
arch=(i686 x86_64)
license=('GPL')
depends=('pygtk>=2.12.1' 'pygtksourceview2>=2.2.0' 'enchant>=1.3.0' 'libgnomeui>=2.22.1' 'desktop-file-utils' 'iso-codes' 'gtksourceview2>=2.2.1')
makedepends=('perlxml' 'pkgconfig' 'gnome-doc-utils>=0.12.2')
groups=('gnome-extra')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
install=gedit.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('ee797f4e2eed291dc28ef8ff7082445e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper || return 1
  make || return 1
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1
 
  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
