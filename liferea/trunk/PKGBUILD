# $Id: PKGBUILD,v 1.84 2008/03/13 03:15:27 eric Exp $
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Ben <ben@benmazer.net>

pkgname=liferea
pkgver=1.4.15
pkgrel=1
pkgdesc="A GTK desktop news aggregator for online news feeds and weblogs"
arch=('i686' 'x86_64')
url="http://liferea.sourceforge.net/"
license=('GPL')
depends=('gtk2>=2.10.11' 'gconf>=2.18.0.1-4' 'xulrunner>=1.8.1.11' 'libnotify>=0.4.4' 'libnetworkmanager' 'libxslt>=1.1.20' 'libglade' 'sqlite3')
makedepends=('perlxml' 'pkgconfig' 'diffutils')
options=('!libtool')
install=liferea.install
source=(http://downloads.sourceforge.net/sourceforge/liferea/liferea-${pkgver}.tar.gz)
md5sums=('e4ae96a0d41d94c31271ba791caec922')
sha1sums=('8ff9ed78b03c89a8bc2ff4f8070e665a5cb496c5')

build() {
  [ -z "${MOZ_PLUGIN_PATH}" ] && . /etc/profile.d/mozilla-common.sh

  cd ${startdir}/src/liferea-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-gtkhtml2
  make LDFLAGS+="-R/usr/lib/xulrunner" || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install
  
  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
