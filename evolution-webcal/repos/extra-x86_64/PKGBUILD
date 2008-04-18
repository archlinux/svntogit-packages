# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=evolution-webcal
pkgver=2.21.92
pkgrel=1
pkgdesc="Evolution Web calendar"
arch=(i686 x86_64)
license=('GPL')
install=evolution-webcal.install
url="http://www.ximian.com"
depends=('libgnomeui>=2.22.01' 'evolution-data-server>=2.22.0')
makedepends=('perlxml' 'pkgconfig' 'evolution>=2.12.0')
groups=('gnome-extra')
options=(!emptydirs)
source=(http://ftp.acc.umu.se/pub/GNOME/sources/evolution-webcal/2.21/${pkgname}-${pkgver}.tar.bz2)
md5sums=('049ea414f6d82a1e4b1e88f71a4f19cb')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/evolution-webcal \
              --localstatedir=/var  || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
