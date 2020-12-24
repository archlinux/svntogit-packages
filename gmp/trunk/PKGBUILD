# Maintainer: Allan McRae <allan@archlinux.org>
# Contributer: Jan de Groot <jgc@archlinux.org>

pkgname=gmp
pkgver=6.2.1
pkgrel=1
pkgdesc='A free library for arbitrary precision arithmetic'
arch=(x86_64)
url='https://gmplib.org/'
depends=(gcc-libs sh)
license=(LGPL3 GPL)
source=(https://gmplib.org/download/gmp/gmp-$pkgver.tar.lz{,.sig})
md5sums=('03a31d8cbaf29d136252f8f38875ed82'
         'SKIP')
validpgpkeys=('343C2FF0FBEE5EC2EDBEF399F3599FF828C67298')   # Niels Möller

build() {
  cd $pkgname-$pkgver

  ./configure --build=${CHOST} \
    --prefix=/usr \
    --enable-cxx \
    --enable-fat
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
