# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-control-center
pkgver=2.22.1
pkgrel=1
pkgdesc="The Control Center for GNOME"
arch=(i686 x86_64)
depends=('libgnomekbd>=2.22.0' 'metacity>=2.22.0' 'nautilus>=2.22.2' 'gstreamer0.10-base>=0.10.18' 'libxss' 'gnome-panel>=2.22.1.3' 'desktop-file-utils' 'gnome-settings-daemon>=2.22.1')
makedepends=('perlxml' 'gnome-doc-utils>=0.12.2' 'pkgconfig')
url="http://www.gnome.org"
groups=('gnome')
replaces=('control-center')
conflicts=('control-center')
provides=('control-center')
install=gnome-control-center.install
license=('GPL')
options=('!libtool' '!emptydirs')
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('170815bcf2627bf64436283f86c751aa')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  # Don't generate files which are generated in postinstall
  sed -i -e '/update-desktop-database/d' vfs-methods/*/Makefile.* || return 1

  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --enable-gstreamer=0.10 --enable-aboutme \
	      --disable-scrollkeeper --disable-update-mimedb || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
