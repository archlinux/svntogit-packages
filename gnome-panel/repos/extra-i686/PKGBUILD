# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-panel
pkgver=2.22.1.3
pkgrel=1
pkgdesc="The GNOME Panel"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org"
depends=('libwnck>=2.22.1' 'gnome-menus>=2.22.1' 'evolution-data-server>=2.22.1' 'gnome-desktop>=2.22.1' 'libgweather>=2.22.1.2' 'librsvg>=2.22.2')
makedepends=('perlxml' 'gnome-doc-utils>=0.12.2' 'pkgconfig')
options=('!libtool' '!emptydirs')
groups=('gnome')
install=gnome-panel.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('af5e33b27c4b4a8f932baa8530dd79b9')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --libexecdir=/usr/lib/gnome-panel \
	      --disable-network-manager \
	      --disable-scrollkeeper || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
