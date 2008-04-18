# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=libsexy
pkgver=0.1.11
pkgrel=1
pkgdesc="Doing naughty things to good widgets."
arch=(i686 x86_64)
license=('GPL')
url="http://chipx86.com/wiki/Libsexy"
depends=('gtk2>=2.10.11' 'libxml2>=2.6.27')
makedepends=('iso-codes' 'pkgconfig')
options=('nolibtool')
source=(http://releases.chipx86.com/libsexy/libsexy/${pkgname}-${pkgver}.tar.gz)
md5sums=('33c079a253270ec8bfb9508e4bb30754')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-static
  make || return 1
  make DESTDIR=${startdir}/pkg install

  rm -f ${startdir}/pkg/usr/lib/libsexy.a
}
