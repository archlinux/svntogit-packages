# $Id$
# Maintainer: Roman Kyrylych <roman@archlinux.org>

pkgname=bluez-gnome
pkgver=0.25
pkgrel=1
pkgdesc="bluetooth PIN helper application"
arch=('i686' 'x86_64')
url="http://www.bluez.org/"
license=('GPL')
depends=('hal' 'libnotify>=0.4.4-1' 'gconf>=2.18.0.1-4' 'obex-data-server'
         'bluez-utils' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('perlxml')
install=bluez-gnome.install
source=(http://bluez.sourceforge.net/download/${pkgname}-${pkgver}.tar.gz)
md5sums=('4acb0c83b351e4f36e88c6d775f15837')
options=('!emptydirs')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-desktop-update --disable-mime-update --disable-icon-update
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas \
    ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
