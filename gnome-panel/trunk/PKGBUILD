# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-panel
pkgver=2.22.1.2
pkgrel=3
pkgdesc="The GNOME Panel"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnome.org"
depends=('libwnck>=2.22.1' 'gnome-menus>=2.22.1' 'evolution-data-server>=2.22.1' 'gnome-desktop>=2.22.1' 'libgweather>=2.22.1.1' 'librsvg>=2.22.2')
makedepends=('perlxml' 'gnome-doc-utils>=0.12.2' 'pkgconfig')
options=('!libtool' '!emptydirs')
groups=('gnome')
install=gnome-panel.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2
	clock.patch)
md5sums=('bf89eb75655557c6a1ab9dbd37f028a6' 'ba7e950377e44297b7b964d74b3e635b')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ${startdir}/src/clock.patch || return 1
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
