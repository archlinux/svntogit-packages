# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=banshee
pkgver=0.98.1
pkgrel=1
pkgdesc="Music management and playback for GNOME"
arch=('i686' 'x86_64')
url="http://banshee-project.org/"
license=('MIT')
depends=('sqlite3' 'ndesk-dbus-glib>=0.4.1' 'mono-addins>=0.3.1' 'taglib-sharp>=2.0.3.0' 'gstreamer0.10-gconf>=0.10.7' 'gstreamer0.10-gnomevfs>=0.10.18' 'gnome-sharp>=2.20.0')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool' '!makeflags' '!emptydirs')
install=banshee.install
source=(http://banshee-project.org/files/${pkgname}/${pkgname}-1-${pkgver}.tar.gz
	gtk-sharp-2.12-compile.patch)
md5sums=('a57fa0556557f66db5ce6c754f9b1ef0' 'f8d10ec280bfe532b78fec92b4deb7d4')

build() {
  export MONO_SHARED_DIR=${startdir}/src/.wabi
  mkdir -p "${MONO_SHARED_DIR}"
  cd ${startdir}/src/${pkgname}-1-${pkgver}
  patch -Np2 -i ${startdir}/src/gtk-sharp-2.12-compile.patch || return 1
  LD_PRELOAD="" ./configure --prefix=/usr \
        --sysconfdir=/etc --localstatedir=/var \
	--disable-helix --enable-ipod --enable-njb --disable-docs \
	--with-gstreamer-0-10 --disable-static || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/ || return 1

  install -d -m755 ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas

  #rm -f ${startdir}/pkg/usr/lib/banshee/Banshee.Dap/libnjbglue.a
}
