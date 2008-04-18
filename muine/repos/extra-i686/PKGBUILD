# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Ben Mazer <blm@groknil.org>

pkgname=muine
pkgver=0.8.8
pkgrel=1
pkgdesc="A music player written in C#"
arch=(i686 x86_64)
license=('GPL')
url="http://www.muine-player.org/"
depends=('gnome-sharp' 'gstreamer0.10-faad>=0.10.4-2' 'desktop-file-utils'
         'gstreamer0.10-vorbis' 'gstreamer0.10-mad' 'gstreamer0.10-flac>=0.10.5-2'
         'gstreamer0.10-gnomevfs' 'gstreamer0.10-gconf' 'libgnomeui>=2.20.1')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool' '!emptydirs')
install=muine.install
source=(http://muine-player.org/releases/muine-${pkgver}.tar.gz)

build() {

  export MONO_SHARED_DIR=${startdir}/src/.wabi
  mkdir -p "${MONO_SHARED_DIR}"
 
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static --enable-gstreamer
  make || return 1
  make DESTDIR=${startdir}/pkg GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 install

  install -m755 plugins/TrayIcon.{dll,xml} ${startdir}/pkg/usr/lib/muine/plugins/
  install -m644 plugins/muine-tray-*.png ${startdir}/pkg/usr/lib/muine/plugins/

  mkdir -p ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
