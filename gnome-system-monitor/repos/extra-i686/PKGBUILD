# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-system-monitor
pkgver=2.22.0
pkgrel=1
pkgdesc="A system monitor for GNOME"
arch=(i686 x86_64)
license=('GPL')
depends=('libgksu>=2.0.5' 'libwnck>=2.22.0' 'gnome-vfs>=2.22.0' 'libgtop>=2.22.0' 'gtkmm>=2.12.5' 'librsvg>=2.22.1')
makedepends=('perlxml' 'pkgconfig' 'gnome-doc-utils>=0.12.2')
options=(!emptydirs)
url="http://www.gnome.org"
groups=('gnome-extra')
install=gnome-system-monitor.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('7b809a4db72902ca5f47a63f62917d14')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-scrollkeeper \
	      --enable-pcrecpp || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
