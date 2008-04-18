# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=totem-plugin
pkgver=2.22.0
pkgrel=1
url="http://www.hadess.net/totem.php3"
pkgdesc="Totem mozilla/firefox plugin"
arch=(i686 x86_64)
license=('GPL')
depends=('totem>=2.22.0')
makedepends=('perlxml' 'iso-codes' 'gnome-icon-theme>=2.20.0' 'xulrunner>=1.8.1.11' 'gstreamer0.10-base' 'gstreamer0.10-gconf' 'gnome-doc-utils>=0.12.2' 'pkgconfig' 'diffutils')
options=('!libtool' '!emptydirs')
source=(http://ftp.gnome.org/pub/gnome/sources/totem/2.22/totem-${pkgver}.tar.bz2)
md5sums=('21a3f983e762b34db035edbaaba9dd63')
	
build() {
  cd ${startdir}/src/totem-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/totem \
              --localstatedir=/var --disable-static \
	      --enable-mozilla --enable-gstreamer || return 1
  make || return 1
  pushd browser-plugin || return 1
  make plugindir=/usr/lib/mozilla/plugins \
       xptdir=/usr/lib/mozilla/plugins \
       DESTDIR=${startdir}/pkg install || return 1
  popd

  rm -f ${startdir}/pkg/usr/lib/totem/totem-plugin-viewer || return 1
  rm -rf ${startdir}/pkg/usr/share || return 1
}
