# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=libmpc
pkgver=1.2.1
pkgrel=2
pkgdesc="Library for the arithmetic of complex numbers with arbitrarily high precision"
arch=('x86_64')
url="http://www.multiprecision.org/"
license=('LGPL')
depends=('mpfr')
source=(https://ftp.gnu.org/gnu/mpc/mpc-${pkgver/_/-}.tar.gz{,.sig})
sha256sums=('17503d2c395dfcf106b622dc142683c1199431d095367c6aacba6eec30340459'
            'SKIP')
validpgpkeys=('AD17A21EF8AED8F1CC02DBD9F7D5C9BF765C61E3')  # Andreas Enge

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
