# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Kritoke <kritoke@nospam.gmail.com>

pkgname=f-spot
pkgver=0.4.2
pkgrel=1
pkgdesc="A personal photo management program for GNOME"
url="http://www.gnome.org/projects/f-spot/"
arch=(i686 x86_64)
license=('GPL')
depends=('gnome-desktop-sharp>=2.20.1' 'ndesk-dbus-glib>=0.4.1' 'lcms' 'libexif' 'libgphoto2>=2.4.0-5' 'libjpeg' 'sqlite3' 'libgnomeui>=2.22.0' 'desktop-file-utils')
makedepends=('intltool' 'pkgconfig' 'gnome-doc-utils>=0.12.2' 'gnome-screensaver>=2.22.0')
options=('!libtool' '!makeflags')
install=f-spot.install
source=(http://ftp.gnome.org/pub/gnome/sources/f-spot/0.4/f-spot-${pkgver}.tar.bz2
	gnome-sharp-2.20.patch)
md5sums=('970b8c9de9acf97c90e3d9608827606d' 'c94c74e1cbccbc8b41a5132668b9abe7')

build() {
  export MONO_SHARED_DIR="${startdir}/src/.wabi"
  mkdir -p "${MONO_SHARED_DIR}"

  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/gnome-sharp-2.20.patch || return 1
  libtoolize --force --copy || return 1
  intltoolize --force --copy || return 1
  aclocal || return 1
  autoconf || return 1
  automake || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --disable-scrollkeeper || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
