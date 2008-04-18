# $Id$
# Maintainer: tobias <tobias@archlinux.org>
# Contributor: Ben Mazer <ben@benmazer.net>

pkgname=gtk-sharp
pkgver=1.0.10
pkgrel=6
pkgdesc="gtk (and gnome) bindings for C#"
arch=(i686 x86_64)
license=(LGPL)
url="http://gtk-sharp.sourceforge.net"
depends=('mono>=1.9' 'vte>=0.16.13' 'librsvg>=2.16.0' 'libgnomeui>=2.22'
         'libgnomeprintui>=2.18.2' 'libgnomedb>=1.2.2-6' 'gtkhtml>=3.18.0')
makedepends=('pkgconfig')
options=('!libtool')
conflicts=('gtk#')
source=(http://go-mono.com/sources/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('e21fb3c5a39374f86ba70b926311a6d0')

build() {
  # get rid of that .wapi errors; thanks to brice
  export MONO_SHARED_DIR=${startdir}/pkg/weird
  mkdir -p "${MONO_SHARED_DIR}"

 # import pathes
  cd ${startdir}/src/${pkgname}-${pkgver}
 # build
  sed -e "s/libgtkhtml-3.6/libgtkhtml-3.14/" \
      -e "s/GTKHTML_VERSION=3.6/GTKHTML_VERSION=3.14/" \
      -e "s/GTKHTML_SOVERSION=18/GTKHTML_SOVERSION=19/" \
      -i configure
  ./configure --prefix=/usr --sysconfdir=/etc
  make || return 1
  make GACUTIL="/usr/bin/gacutil /root ${startdir}/pkg/usr/lib" DESTDIR=${startdir}/pkg install

 # housecleaning
  rm -rf "${MONO_SHARED_DIR}"
}
# vim: ft=sh ts=2 et
