# $Id$
# Maintainer: judd <jvinet@zeroflux.org>
pkgname=bison
pkgver=2.3
pkgrel=4
pkgdesc="The GNU general-purpose parser generator"
arch=(i686 x86_64)
license=('GPL')
url="http://www.gnu.org/software/bison/bison.html"
groups=('base-devel')
depends=('glibc' 'm4')
source=(ftp://ftp.gnu.org/gnu/bison/${pkgname}-${pkgver}.tar.gz)
md5sums=('22327efdd5080e2b1acb6e560a04b43a')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --datadir=/usr/share
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
