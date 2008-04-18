# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>

pkgname=devhelp
pkgver=0.18
pkgrel=2
pkgdesc="API documentation browser for GNOME"
arch=(i686 x86_64)
license=('GPL')
url="http://www.imendio.com/projects/devhelp/"
depends=('gconf>=2.20.1' 'libglade>=2.6.2' 'libwnck>=2.20.3' 'xulrunner>=1.8.1.11' 'desktop-file-utils>=0.14-1')
makedepends=('perlxml>=2.36-1' 'pkgconfig')
options=('!libtool' '!emptydirs')
install="devhelp.install"
source=(http://ftp.gnome.org/pub/GNOME/sources/devhelp/0.18/devhelp-${pkgver}.tar.bz2)
md5sums=('004e038092d39ddb0abb748d89b7ecf6')

build() {
  [ -z "${MOZ_PLUGIN_PATH}" ] && . /etc/profile.d/mozilla-common.sh

  cd ${startdir}/src/devhelp-${pkgver}
  #aclocal -I ./m4
  #autoconf
  #automake
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static
  make LDFLAGS+="-R /opt/mozilla/lib/xulrunner" || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
