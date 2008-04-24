# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=totem
pkgver=2.22.2
pkgrel=1
url="http://www.hadess.net/totem.php3"
pkgdesc="A GNOME2 integrated movie player based on Gstreamer."
arch=(i686 x86_64)
license=('GPL')
depends=('gstreamer0.10-good-plugins' 'totem-plparser>=2.22.2' 'libxxf86vm' 'libxtst' 'desktop-file-utils' 'iso-codes' 'libepc>=0.3.5' 'python>=2.5' 'startup-notification' 'libgnomeui>=2.22.1' 'python-gdata' 'gnome-vfs>=2.22.0-2')
makedepends=('perlxml' 'nautilus>=2.22.2' 'xulrunner>=1.8.1.12' 'pkgconfig' 'bluez-libs' 'lirc-utils' 'gnome-doc-utils>=0.12.2' 'gnome-control-center>=2.22.1' 'libtracker')
options=('!libtool' '!emptydirs')
conflicts=('totem-xine')
groups=('gnome-extra')
install=totem.install
source=(http://ftp.gnome.org/pub/gnome/sources/totem/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('6062080e81b4859f87fee8a592b92489')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/totem \
              --localstatedir=/var --disable-static \
	      --disable-lirc \
	      --enable-nautilus --enable-gstreamer \
	      --enable-mozilla --with-dbus \
	      --disable-scrollkeeper --disable-vanity || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 \
       DESTDIR=${startdir}/pkg install || return 1

  rm -f ${startdir}/pkg/usr/share/totem/vanity.*
  rm -f ${startdir}/pkg/usr/share/pixmaps/vanity.png

  rm -rf ${startdir}/pkg/usr/lib/mozilla

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
