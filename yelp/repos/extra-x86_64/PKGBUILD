# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=yelp
pkgver=2.22.0
pkgrel=1
pkgdesc="A help browser for GNOME"
arch=(i686 x86_64)
depends=('xulrunner>=1.8.1.12' 'libgnomeui>=2.22.01' 'gnome-doc-utils>=0.12.2' 'startup-notification>=0.9' 'libxslt' 'libbeagle')
makedepends=('intltool' 'pkgconfig' 'autoconf' 'libtool' 'gnome-common')
groups=('gnome')
license=('GPL')
options=('!emptydirs')
url="http://www.gnome.org"
install=yelp.install
source=(http://ftp.gnome.org/pub/gnome/sources/yelp/2.22/yelp-${pkgver}.tar.bz2
	yelp-fix-for-beagle-0.3.0.patch)
md5sums=('941e67796bbc332c1db3d63771ae2590'
	 '3bcf1955ac39d08c2137c4dc8057c61f')

build() {
  cd ${startdir}/src/yelp-${pkgver}
  #fix for beagle-0.3.0, thanks momonga linux
  patch -Np1 -i ${startdir}/yelp-fix-for-beagle-0.3.0.patch || return 1
  libtoolize --force --copy || return 1
  autoreconf || return 1
 ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --enable-man --with-search=beagle || return 1
  make LDFLAGS+="-R /usr/lib/xulrunner" || return 1
  make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
