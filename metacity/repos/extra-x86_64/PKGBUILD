# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=metacity
pkgver=2.22.0
pkgrel=1
pkgdesc="A window manager for GNOME2"
arch=(i686 x86_64)
license=('GPL')
depends=('startup-notification>=0.9' 'gconf>=2.22,0')
makedepends=('perlxml' 'pkgconfig')
url="http://www.gnome.org"
groups=('gnome')
options=('!libtool' '!emptydirs')
install=metacity.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('8cb6d02cf66a1003532b4f5d2754d696')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/metacity \
              --localstatedir=/var --disable-static || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
