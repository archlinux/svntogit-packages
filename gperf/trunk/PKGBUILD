#$Id: PKGBUILD,v 1.2 2007/10/28 20:42:14 jgc Exp $
#Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gperf
pkgver=3.0.3
pkgrel=1
pkgdesc="Perfect hash function generator."
arch=('x86_64' 'i686')
url="http://www.gnu.org/software/gperf/"
license=('GPL')
depends=('gcc-libs')
source=(ftp://ftp.gnu.org/gnu/gperf/${pkgname}-${pkgver}.tar.gz)
md5sums=('cc20e58975a38075440423c8fb85fd00')

build() {
  cd $startdir/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
