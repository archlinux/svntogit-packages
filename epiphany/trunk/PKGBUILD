# $Id$
# Maintainer: dale <dale@archlinux.org>

pkgname=epiphany
pkgver=2.22.0
pkgrel=1
install=epiphany.install
pkgdesc="A GNOME2 web browser based on the mozilla rendering engine."
arch=(i686 x86_64)
license=('GPL')
depends=('xulrunner>=1.8.1.12' 'gnome-desktop>=2.22.0' 'iso-codes>=1.1' 'desktop-file-utils' 'libxslt>=1.1.22' 'enchant>=1.3.0' 'libnotify>=0.4.3')
makedepends=('perlxml' 'gnome-doc-utils>=0.12.2' 'gnome-python>=2.22.0' 'pkgconfig' 'libnetworkmanager>=0.6.5')
options=('!libtool' '!emptydirs')
groups=('gnome')
url="http://www.gnome.org/projects/epiphany/"
source=(http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('81ad67d1ad706930a295a7ed9887bf5f')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
        --localstatedir=/var \
        --enable-python \
  	--enable-certificate-manager \
	--enable-dbus \
	--disable-scrollkeeper \
	--with-mozilla=xulrunner \
	--enable-network-manager \
	--enable-spell-checker || return 1
  make LDFLAGS+="-R /usr/lib/xulrunner" || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
