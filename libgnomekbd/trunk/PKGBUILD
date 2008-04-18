# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgnomekbd
pkgver=2.22.0
pkgrel=1
pkgdesc="Gnome keyboard library"
url="http://gswitchit.sourceforge.net"
arch=(i686 x86_64)
license=('LGPL')
depends=('libxklavier>=3.5' 'libgnomeui>=2.22.01')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool' '!emptydirs')
install=libgnomekbd.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('a8b64278ae3471583607d734db9347eb')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  # broken makefiles...
  #rm -f ${startdir}/pkg/usr/lib/*.a

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
