# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=libtool
pkgver=2.2
pkgrel=2
pkgdesc="A generic library support script"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnu.org/software/libtool"
groups=('base-devel')
depends=('sh')
source=(ftp://ftp.gnu.org/pub/gnu/libtool/${pkgname}-${pkgver}.tar.gz
	libtool-2.2-regressions.patch)
md5sums=('217e9ec3e3cbdf891cbd4772140964a1' '99298e18b12033fc0eac5e5af16add3e')
options=('!libtool')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ${startdir}/src/libtool-2.2-regressions.patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
