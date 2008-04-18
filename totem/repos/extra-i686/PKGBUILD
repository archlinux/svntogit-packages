# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=totem
pkgver=2.22.0
pkgrel=2
url="http://www.hadess.net/totem.php3"
pkgdesc="A GNOME2 integrated movie player based on Gstreamer."
arch=(i686 x86_64)
license=('GPL')
depends=('gstreamer0.10-gconf>=0.10.7' 'gstreamer0.10-base>=0.10.16' 'totem-plparser>=2.22.1' 'libxxf86vm' 'libxtst' 'desktop-file-utils' 'iso-codes' 'libepc>=0.3.4-2' 'python>=2.5' 'startup-notification' 'libgnomeui>=2.22.01' 'python-gdata' 'gnome-vfs>=2.22.0-2')
makedepends=('perlxml' 'nautilus>=2.22.0' 'xulrunner>=1.8.1.12' 'pkgconfig' 'bluez-libs' 'lirc-utils' 'gnome-doc-utils>=0.12.2' 'gnome-control-center>=2.22.0' 'libtracker')
options=('!libtool' '!emptydirs')
conflicts=('totem-xine')
groups=('gnome-extra')
install=totem.install
source=(http://ftp.gnome.org/pub/gnome/sources/totem/2.22/${pkgname}-${pkgver}.tar.bz2)
md5sums=('21a3f983e762b34db035edbaaba9dd63')

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
