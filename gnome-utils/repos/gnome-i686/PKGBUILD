# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-utils
pkgver=2.20.0.1
pkgrel=3
pkgdesc="Common utilities for GNOME"
arch=(i686 x86_64)
license=('GPL')
depends=('libgtop>=2.22.0' 'libgnomeprintui>=2.18.2' 'gnome-panel>=2.22.0')
makedepends=('perlxml' 'gnome-doc-utils>=0.12.2' 'pkgconfig')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org"
groups=('gnome-extra')
install=gnome-utils.install
source=(http://ftp.gnome.org/pub/gnome/sources/${pkgname}/2.20/${pkgname}-${pkgver}.tar.bz2
	bgo497489.patch)
md5sums=('2d4385df2fb566b437b283bd2ce70190' '22922b4c54438b8808d5b942459da1db')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np1 -i ${startdir}/src/bgo497489.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/gnome-utils \
              --localstatedir=/var --disable-static \
              --enable-hal --disable-scrollkeeper || return 1
  make || return 1
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${startdir}/pkg install || return 1

  install -m755 -d ${startdir}/pkg/usr/share/gconf/schemas
  gconf-merge-schema ${startdir}/pkg/usr/share/gconf/schemas/${pkgname}.schemas ${startdir}/pkg/etc/gconf/schemas/*.schemas || return 1
  rm -f ${startdir}/pkg/etc/gconf/schemas/*.schemas
}
