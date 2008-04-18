# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
pkgname=freeciv
pkgver=2.1.3
pkgrel=1
pkgdesc="A multiuser clone of the famous Microprose game of Civilization"
arch=('i686' 'x86_64')
depends=('gtk2' 'sdl_mixer' 'esd' 'readline')
makedepends=('pkgconfig')
license=('GPL')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
url="http://www.freeciv.org/"

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
md5sums=('2b5e96c6464212273150f8d3ec0bf7f7')
