# $Id$
# Maintainer: tobias <tobias@archlinux.org>

pkgname=mrtg
pkgver=2.15.2
pkgrel=1
pkgdesc="Multi Router Traffic Grapher."
arch=(i686 x86_64)
url="http://oss.oetiker.ch/mrtg/"
license=('GPL')
depends=('gd' 'perl')
source=(${url}/pub/${pkgname}-${pkgver}.tar.gz)
md5sums=('5827175dd5ee941c2ae894369f0c9071')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make prefix=${startdir}/pkg/usr install
}
