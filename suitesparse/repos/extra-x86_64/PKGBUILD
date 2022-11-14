# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=suitesparse
pkgver=6.0.1
pkgrel=1
pkgdesc='A collection of sparse matrix libraries'
url='http://faculty.cse.tamu.edu/davis/suitesparse.html'
arch=(x86_64)
depends=(lapack mpfr)
makedepends=(gcc-fortran cmake)
license=(GPL)
source=(https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('06f55a0449775d1f43d8a33ba8c8417ea8cf76c27833b465c49825baa8741d0c')

build() {
  cd SuiteSparse-$pkgver
  CXXFLAGS+=" -ffat-lto-objects" \
  CMAKE_OPTIONS="-DBLA_VENDOR=Generic \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=None" \
  make
}


package() {
  cd SuiteSparse-$pkgver
  DESTDIR="$pkgdir" make install
}
