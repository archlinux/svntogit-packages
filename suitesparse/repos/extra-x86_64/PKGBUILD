# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgbase=suitesparse
pkgname=(suitesparse suitesparse64)
pkgver=7.0.1
pkgrel=2
pkgdesc='A collection of sparse matrix libraries'
url='http://faculty.cse.tamu.edu/davis/suitesparse.html'
arch=(x86_64)
makedepends=(gcc-fortran cmake lapack lapack64)
license=(GPL)
source=(https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('dc2f8d5c2657c120b30cce942f634ec08fc3a4b0b10e19d3eef7790b2bec8d1e')

prepare() {
  cp -r SuiteSparse-$pkgver SuiteSparse64
}

build() {
  cd SuiteSparse-$pkgver
  CXXFLAGS+=" -ffat-lto-objects" \
  CMAKE_OPTIONS="-DBLA_VENDOR=Generic \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=None" \
  make

  cd ../SuiteSparse64
  CXXFLAGS+=" -ffat-lto-objects" \
  CMAKE_OPTIONS="-DBLA_VENDOR=Generic \
  -DALLOW_64BIT_BLAS=ON \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=None" \
  make
}

package_suitesparse() {
  depends=(lapack mpfr)

  cd SuiteSparse-$pkgver
  DESTDIR="$pkgdir" make install
}

package_suitesparse64() {
  pkgdesc+=' (compiled with BLAS64)'
  depends=(lapack64 mpfr)
  conflicts=(suitesparse)
  provides=(suitesparse)

  cd SuiteSparse64
  DESTDIR="$pkgdir" make install
}
