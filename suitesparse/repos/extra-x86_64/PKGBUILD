# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=suitesparse
pkgver=6.0.0
pkgrel=2
pkgdesc='A collection of sparse matrix libraries'
url='http://faculty.cse.tamu.edu/davis/suitesparse.html'
arch=(x86_64)
depends=(lapack mpfr)
makedepends=(gcc-fortran cmake)
license=(GPL)
options=(staticlibs)
source=(https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/DrTimothyAldenDavis/SuiteSparse/commit/769870a0.patch)
sha256sums=('3b07fc5cec46fa66f18f0fbd6a81ad5d552533020bb3595f27c24a0274c89b7a'
            'c8514871dccc75c84ed974262de0e7c593ed9ce9c458dde166d5ac2e72182f99')

prepare() {
  patch -d SuiteSparse-$pkgver -p1 < 769870a0.patch # Hide C BLAS prototypes from public headers
}

build() {
  cd SuiteSparse-$pkgver

  CMAKE_OPTIONS="-DBLA_VENDOR=Generic \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=None" \
  make
}


package() {
  cd SuiteSparse-$pkgver
  install -dm755 "${pkgdir}"/usr/{include,lib}

  DESTDIR="$pkgdir" make install
}
