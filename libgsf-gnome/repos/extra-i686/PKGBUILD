# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=libgsf-gnome
pkgver=1.14.8
pkgrel=1
pkgdesc="Adds gnome support to libgsf"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://www.gnome.org/"
depends=('gnome-vfs>=2.22.0' 'libbonobo>=2.22.0' "libgsf>=${pkgver}" 'gconf>=2.20.0')
makedepends=('perlxml' 'pkgconfig')
options=('!libtool' '!emptydirs')
install=libgsf-gnome.install
source=(http://ftp.gnome.org/pub/GNOME/sources/libgsf/1.14/libgsf-${pkgver}.tar.bz2)
md5sums=('09e4b6639be79fa888cabc751f73674f')

build() {
  cd ${startdir}/src/libgsf-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var || return 1
  pushd gsf-gnome || return 1
  sed -i -e 's|$(top_builddir)/gsf/libgsf-1.la|-lgsf-1|g' Makefile || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -d -m755 ${startdir}/pkg/usr/lib/pkgconfig || return 1
  sed ../libgsf-gnome-1.pc -e 's|^Cflags.*|Cflags: -I${includedir}/libgsf-1|' >\
	${startdir}/pkg/usr/lib/pkgconfig/libgsf-gnome-1.pc || return 1
  popd
  pushd thumbnailer || return 1
  sed -i -e 's|$(top_builddir)/gsf/libgsf-1.la|-lgsf-1|g' Makefile || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  popd
  pushd doc || return 1
  make DESTDIR=${startdir}/pkg install-manpageDATA || return 1
  rm -f ${startdir}/pkg/usr/share/man/man1/gsf.1
  popd
  
  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
