# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Eric Johnson <eric@archlinux.org>
pkgname=libidn
pkgver=1.0
pkgrel=1
pkgdesc="Implementation of the Stringprep, Punycode and IDNA specifications"
arch=(i686 x86_64)
url="http://www.gnu.org/software/libidn/"
license=('GPL' 'LGPL')
depends=('glibc')
makedepends=('pkgconfig')
options=('!libtool')
source=(ftp://alpha.gnu.org/pub/gnu/libidn/${pkgname}-${pkgver}.tar.gz)
md5sums=('8a6a15dc061c0e17a97cb6b77d850e86')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
