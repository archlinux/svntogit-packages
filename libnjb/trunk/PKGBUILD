# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=libnjb
pkgver=2.2.5
pkgrel=3
pkgdesc="Library for communicating with various portable MP3 players"
arch=('i686' 'x86_64')
url="http://libnjb.sourceforge.net/"
license=('BSD')
depends=('libusb' 'ncurses' 'zlib')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://switch.dl.sourceforge.net/sourceforge/libnjb/${pkgname}-${pkgver}.tar.gz
	45-libnjb.rules)
md5sums=('f7461574b9a28ed1c79fb40d3d307d78' '7fe0e29076d6d1ae0b16e0916f297123')

build() {
  cd ${startdir}/src/libnjb-${pkgver}
  ./configure --prefix=/usr --disable-hotplugging
  make || return 1
  make DESTDIR=${startdir}/pkg install
  mkdir -p ${startdir}/pkg/etc/udev/rules.d
  install -m644 ${startdir}/src/45-libnjb.rules ${startdir}/pkg/etc/udev/rules.d/
  install -D -m644 LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
}
