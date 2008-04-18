# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Arjan Timmerman <arjan@archlinux.org>

pkgname=libxklavier
pkgver=3.5
pkgrel=1
pkgdesc="High-level API for X Keyboard Extension"
arch=(i686 x86_64)
license=('LGPL')
depends=('libxkbfile>=1.0.4' 'libxml2>=2.6.31' 'glib2>=2.16.1' 'xkeyboard-config>=1.2')
makedepends=('pkgconfig')
options=('!libtool' '!emptydirs')
url="http://gswitchit.sourceforge.net"
source=(http://downloads.sourceforge.net/gswitchit/${pkgname}-${pkgver}.tar.gz)
md5sums=('d0625fdd7e22dbe382af40872fbbe77b')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  sed -i -e 's/-Werror//g' libxklavier/Makefile.{in,am} || return 1
  ./configure --prefix=/usr \
	--with-xkb-base=/usr/share/X11/xkb --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
