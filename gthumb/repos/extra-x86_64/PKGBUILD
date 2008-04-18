# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tobias Kieslich <tobias@justdreams.de>
 
pkgname=gthumb
pkgver=2.10.8
pkgrel=1
pkgdesc="Image browser and viewer for the GNOME Desktop"
arch=(i686 x86_64)
license=('GPL')
url="http://gthumb.sourceforge.net/"
depends=('libgphoto2>=2.3.1' 'libgnomeui>=2.20.1.1' 'libxtst' 'libxxf86vm' 'desktop-file-utils')
makedepends=('perlxml' 'pkgconfig' 'gnome-doc-utils>=0.12.0')
options=('!libtool' '!emptydirs')
install=gthumb.install
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/2.10/${pkgname}-${pkgver}.tar.bz2)
md5sums=('104ca627037ccacf1aff18cc3923b40e')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --disable-scrollkeeper
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
