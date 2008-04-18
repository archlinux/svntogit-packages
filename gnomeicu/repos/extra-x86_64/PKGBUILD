# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnomeicu
pkgver=0.99.12
pkgrel=3
pkgdesc="A GNOME2 ICQ client."
arch=(i686 x86_64)
license=('GPL')
depends=('libgnomeui>=2.18.1-2' 'libxss' 'scrollkeeper')
makedepends=('pkgconfig')
url="http://gnomeicu.sourceforge.net/"
install=gnomeicu.install
source=(http://dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('91d534e19a9f9e408f1f97b3b0748d20')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  if [ -f omf.make ]; then
    find . -name Makefile.in -exec sed -i -e 's/-scrollkeeper-update.*//' {} \;
    sed -i -e 's/-scrollkeeper-update.*//' omf.make
  fi
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
