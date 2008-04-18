# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=tomboy
pkgver=0.10.0
pkgrel=3
pkgdesc="Desktop note-taking application for Linux and Unix"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org/projects/tomboy/"
depends=('libgnomeprintui>=2.18.2' 'gtkspell' 'gmime>=2.2.18' 'ndesk-dbus-glib>=0.4.1' 'gnome-sharp>=2.20.0' 'mono-addins>=0.3.1')
makedepends=('perlxml' 'pkgconfig' 'gnome-panel>=2.22.0' 'gnome-doc-utils>=0.12.2')
options=('!libtool' '!emptydirs')
groups=('gnome-extra')
install=tomboy.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/0.10/${pkgname}-${pkgver}.tar.bz2)
md5sums=('cf200d49beae64260b9e029b6dcc579a')

build() {
  export MONO_SHARED_DIR=${startdir}/src/.wabi
  mkdir -p "${MONO_SHARED_DIR}"
 
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
