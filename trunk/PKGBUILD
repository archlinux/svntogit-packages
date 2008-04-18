# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=nautilus
pkgver=2.22.2
pkgrel=1
pkgdesc="The GNOME shell and file manager"
arch=(i686 x86_64)
license=('GPL')
depends=('librsvg>=2.22.2' 'eel>=2.22.1' 'libbeagle>=0.3.5' 'libtracker>=0.6.6' 'libexif>=0.6.16' 'exempi>=1.99.9-2' 'gnome-icon-theme>=2.22.0' 'desktop-file-utils' 'gvfs>=0.2.3')
makedepends=('perlxml' 'pkgconfig')
url="http://www.gnome.org"
groups=('gnome')
replaces=('fontilus')
options=('!libtool' '!emptydirs')
install=nautilus.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('4758815c46f350bd314d9e104f0a1b72')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --disable-update-mimedb --disable-esound || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1
  
  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
