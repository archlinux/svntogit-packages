# $Id$
# Maintainer: Roman Kyrylych <roman@archlinux.org>

pkgname=mail-notification
pkgver=5.0
pkgrel=1
pkgdesc="Tray icon application that informs you if you have new mail"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/mailnotify/"
license=('GPL3' 'FDL')
depends=('eel>=2.18.0-2' 'cyrus-sasl-plugins' 'gmime>=2.2.6' 'libnotify>=0.4.4'
         'gconf>=2.18.0.1-4' 'gnome-keyring' 'hicolor-icon-theme'
         'desktop-file-utils')
makedepends=('gob2' 'perlxml' 'evolution>=2.12' 'gnome-doc-utils>=0.12.0')
options=('!libtool' '!emptydirs')
install=mail-notification.install
source=(http://savannah.nongnu.org/download/mailnotify/${pkgname}-${pkgver}.tar.bz2)
md5sums=('66bc819ef62a050627627b3496e4dfe8')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static --disable-scrollkeeper
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas \
    ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
} 
