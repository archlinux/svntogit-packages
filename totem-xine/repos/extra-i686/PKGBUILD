# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=totem-xine
pkgver=2.22.0
pkgrel=2
url="http://www.hadess.net/totem.php3"
pkgdesc="A GNOME2 integrated movie player based on xine."
arch=(i686 x86_64)
license=('GPL')
depends=('xine-lib>=1.1.10' 'totem-plparser>=2.22.1' 'libxxf86vm' 'libxtst' 'desktop-file-utils' 'libepc>=0.3.4-2' 'libgnomeui>=2.22.01' 'startup-notification' 'iso-codes' 'python-gdata')
makedepends=('perlxml' 'gnome-control-center>=2.22.0' 'nautilus>=2.22.0' 'xulrunner>=1.8.1.12' 'pkgconfig' 'bluez-libs' 'lirc-utils' 'gnome-doc-utils>=0.12.2')
options=('!libtool' '!emptydirs')
conflicts=('totem')
provides=("totem=${pkgver}")
install=totem.install
source=(http://ftp.gnome.org/pub/gnome/sources/totem/2.22/totem-${pkgver}.tar.bz2)
md5sums=('21a3f983e762b34db035edbaaba9dd63')

build() {
  cd ${startdir}/src/totem-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/totem \
              --localstatedir=/var --disable-static \
	      --disable-lirc \
	      --enable-nautilus --enable-xine \
	      --enable-mozilla --with-dbus \
	      --disable-scrollkeeper --disable-vanity || return 1
  make || return 1
  
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 \
       DESTDIR=${startdir}/pkg install || return 1

  rm -f ${startdir}/pkg/usr/share/totem/vanity.*
  rm -f ${startdir}/pkg/usr/share/pixmaps/vanity.png

  rm -rf ${startdir}/pkg/usr/lib/mozilla

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
