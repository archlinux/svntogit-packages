# Maintainer: Allan McRae <allan@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=mpfr
pkgver=4.0.1
pkgrel=1
pkgdesc='Multiple-precision floating-point library'
arch=(x86_64)
url='http://www.mpfr.org/'
license=(LGPL)
depends=('gmp>=5.0')
source=(http://www.mpfr.org/mpfr-$pkgver/mpfr-${pkgver}.tar.xz{,.asc})
validpgpkeys=('07F3DBBECC1A39605078094D980C197698C3739D')
sha256sums=('67874a60826303ee2fb6affc6dc0ddd3e749e9bfcb4c8655e3953d0458a6e16e'
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
