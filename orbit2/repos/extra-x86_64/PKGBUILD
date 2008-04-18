# $Id$
# Maintainer: Jan de Groot <jan@archlinux.org>

pkgname=orbit2
pkgver=2.14.12
pkgrel=1
pkgdesc="Thin/fast CORBA ORB"
arch=(i686 x86_64)
license=('LGPL' 'GPL')
depends=('libidl2>=0.8.10')
makedepends=('pkgconfig')
options=('!libtool' '!makeflags')
install=orbit.install
url="http://www.gnome.org"
source=(http://ftp.gnome.org/pub/gnome/sources/ORBit2/2.14/ORBit2-${pkgver}.tar.bz2)
md5sums=('6f4bf7d803d442e9d093a0daa203d506')

build() {
  cd ${startdir}/src/ORBit2-${pkgver}
  ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
