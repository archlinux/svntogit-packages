# $Id$
# Maintainer: Kevin <kevin@archlinux.org>
# Contributor: criminy <criminy@gmail.com>

pkgname=cairomm
pkgver=1.4.8
pkgrel=1
pkgdesc="C++ bindings to Cairo vector graphics library"
arch=('i686' 'x86_64')
url="http://www.cairographics.org"
license=('LGPL' 'MPL')
depends=('cairo>=1.4.14' 'gcc-libs>=4.3.0')
makedepends=('pkgconfig')
source=(http://www.cairographics.org/releases/${pkgname}-${pkgver}.tar.gz)
options=('!libtool' '!emptydirs')
md5sums=('2b2025b3555fa1665d92cf9f9be1a4d3')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}

