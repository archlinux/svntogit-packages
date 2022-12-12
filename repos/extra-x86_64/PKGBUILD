# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>

pkgname=suitesparse
pkgver=6.0.2
pkgrel=1
pkgdesc='A collection of sparse matrix libraries'
url='http://faculty.cse.tamu.edu/davis/suitesparse.html'
arch=(x86_64)
depends=(lapack mpfr)
makedepends=(gcc-fortran cmake)
license=(GPL)
source=(https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('c5d960cd210279c3c83a27747aca2fdeb2e4a13af42870ca0635739accdc6847')

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
