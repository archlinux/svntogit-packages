# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=libmpc
pkgver=1.3.0
pkgrel=2
pkgdesc='Library for the arithmetic of complex numbers with arbitrarily high precision'
arch=(x86_64)
url='http://www.multiprecision.org/'
license=(LGPL)
depends=(mpfr)
source=(https://ftp.gnu.org/gnu/mpc/mpc-${pkgver/_/-}.tar.gz{,.sig}
        mpc-fix-includes.patch)
sha256sums=('0e3b12181d37207230f5a7a7ddcfc22abfc5fc9c05825e1a65401a489a432a2a'
            'SKIP'
            '998032f3a42a6774970464ad7a8dd47d028b5da601dbe11c7853485a1dc85509')
validpgpkeys=('AD17A21EF8AED8F1CC02DBD9F7D5C9BF765C61E3')  # Andreas Enge

prepare() {
  cd mpc-$pkgver
  patch -p1 < ../mpc-fix-includes.patch # Fix build of gcc
}

build() {
  cd mpc-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd mpc-$pkgver
  make check
}

package() {
  cd mpc-$pkgver
  make DESTDIR="$pkgdir" install
  mv "$pkgdir"/usr/share/info/{mpc,libmpc}.info
}
