# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=mpfr
pkgver=4.1.0
pkgrel=1
pkgdesc='Multiple-precision floating-point library'
arch=(x86_64)
url='https://www.mpfr.org/'
license=(LGPL)
depends=('gmp>=5.0')
source=(https://ftp.gnu.org/gnu/mpfr/mpfr-${pkgver}.tar.xz{,.sig})
validpgpkeys=('07F3DBBECC1A39605078094D980C197698C3739D')
sha256sums=('0c98a3f1732ff6ca4ea690552079da9c597872d30e96ec28414ee23c95558a7f'
            'SKIP')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-thread-safe --enable-shared
  make
}

check() {
  cd $pkgname-$pkgver
  make check
  make check-exported-symbols
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
