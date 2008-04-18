# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=libxml++2
pkgver=2.22.0
pkgrel=1
pkgdesc="C++ bindings to libxml - version 2x"
arch=(i686 x86_64)
license=('LGPL')
url="http://libxmlplusplus.sourceforge.net/"
depends=('libxml2>=2.6.31' 'glibmm>=2.16.0')
makedepends=('pkgconfig')
options=('!libtool' '!emptydirs')
source=(http://ftp.gnome.org/pub/GNOME/sources/libxml++/2.22/libxml++-${pkgver}.tar.bz2)
md5sums=('9a9b3ba876fe212df3a73c5a97e9235a')

build() {
  cd ${startdir}/src/libxml++-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
