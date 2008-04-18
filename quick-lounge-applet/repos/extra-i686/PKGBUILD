# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Kritoke <typeolinux@yahoo.com>

pkgname=quick-lounge-applet
pkgver=2.12.4
pkgrel=1
pkgdesc="A GNOME2 applet that you can organize your preferred applications in a single place."
arch=(i686 x86_64)
license=('GPL')
depends=('gnome-panel>=2.18.1' 'scrollkeeper')
makedepends=('pkgconfig' 'gnome-doc-utils>=0.10.3')
url="http://quick-lounge.sourceforge.net/"
install=quick-lounge.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.12/${pkgname}-${pkgver}.tar.bz2)
md5sums=('20da41a503486459c32c91028495ca8c')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  find . -name Makefile.in -exec sed -i -e 's/-scrollkeeper-update.*//' {} \;
  if [ -f omf.make ]; then
    sed -i -e 's/-scrollkeeper-update.*//' omf.make
  fi

  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/quick-lounge-applet \
              --localstatedir=/var --disable-scrollkeeper
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
