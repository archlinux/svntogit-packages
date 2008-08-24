# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=bug-buddy
pkgver=2.22.0
pkgrel=1
pkgdesc="A bug reporting tool for GNOME"
arch=(i686 x86_64)
install=bug-buddy.install
depends=('gnome-menus>=2.22.0' 'gnome-desktop>=2.22.0' 'evolution-data-server>=2.22.0' 'libgtop>=2.22.0' 'libelf')
makedepends=('perlxml' 'pkgconfig')
groups=('gnome-extra')
license=(GPL)
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('092e1f91d0be4ca133cd0650622a6b06')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
