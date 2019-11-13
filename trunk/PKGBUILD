# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=mpfr
pkgver=4.0.2
pkgrel=2
pkgdesc='Multiple-precision floating-point library'
arch=(x86_64)
url='https://www.mpfr.org/'
license=(LGPL)
depends=('gmp>=5.0')
source=(https://www.mpfr.org/mpfr-$pkgver/mpfr-${pkgver}.tar.xz{,.asc})
validpgpkeys=('07F3DBBECC1A39605078094D980C197698C3739D')
sha256sums=('1d3be708604eae0e42d578ba93b390c2a145f17743a744d8f3f8c2ad5855a38a'
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
