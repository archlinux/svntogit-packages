# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gok
pkgver=1.3.7
pkgrel=2
pkgdesc="Gnome Onscreen Keyboard"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org"
depends=('gnome-speech>=0.4.18' 'libgnomeui>=2.22.01' 'at-spi>=1.22.0' 'libwnck>=2.22.0')
makedepends=('perlxml' 'pkgconfig' 'gnome-doc-utils>=0.12.2')
options=('!emptydirs')
groups=('gnome-extra')
install=gok.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/1.3/${pkgname}-${pkgver}.tar.bz2)
md5sums=('14b2407604ceec0ffcbf4866fef35502')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=$startdir/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
