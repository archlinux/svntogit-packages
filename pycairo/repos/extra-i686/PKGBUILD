# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=pycairo
pkgver=1.4.0
pkgrel=3
pkgdesc="Python bindings for the cairo graphics library"
arch=(i686 x86_64)
license=('LGPL' 'MPL')
depends=('python>=2.5' 'cairo>=1.4.10')
options=('!libtool')
source=(http://cairographics.org/releases/${pkgname}-${pkgver}.tar.gz)
url="http://www.cairographics.org/"
md5sums=('e26e77919b606113f565d70036c1f504')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
