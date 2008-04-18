# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libsigc++2.0
pkgver=2.2.2
pkgrel=1
pkgdesc="Libsigc++ implements a full callback system for use in widget libraries - V2"
arch=(i686 x86_64)
license=('LGPL')
url="http://libsigc.sourceforge.net/"
source=(http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2/libsigc++-${pkgver}.tar.bz2)
depends=('gcc-libs>=4.3.0')
options=(!libtool !emptydirs)
md5sums=('962493fd6b26425f21504c3416c4efa1')

build() {
  cd ${startdir}/src/libsigc++-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
