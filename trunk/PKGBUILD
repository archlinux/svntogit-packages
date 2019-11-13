# Maintainer: Allan McRae <allan@archlinux.org>

pkgname=libmpc
pkgver=1.1.0
pkgrel=2
pkgdesc="Library for the arithmetic of complex numbers with arbitrarily high precision"
arch=('x86_64')
url="http://www.multiprecision.org/"
license=('LGPL')
depends=('mpfr')
source=(https://ftp.gnu.org/gnu/mpc/mpc-${pkgver/_/-}.tar.gz{,.sig})
md5sums=('4125404e41e482ec68282a2e687f6c73'
         'SKIP')
validpgpkeys=('AD17A21EF8AED8F1CC02DBD9F7D5C9BF765C61E3')  # Andreas Enge

build() {
  cd "${srcdir}/mpc-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${srcdir}/mpc-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/mpc-${pkgver}"
  make DESTDIR="${pkgdir}" install
  mv ${pkgdir}/usr/share/info/{mpc,libmpc}.info
}
