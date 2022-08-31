# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=suitesparse
pkgver=5.13.0
pkgrel=1
pkgdesc='A collection of sparse matrix libraries'
url='http://faculty.cse.tamu.edu/davis/suitesparse.html'
arch=(x86_64)
depends=(metis lapack mpfr)
makedepends=(gcc-fortran cmake chrpath)
license=(GPL)
options=(staticlibs)
source=(https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        suitesparse-no-demo.patch)
sha256sums=('59c6ca2959623f0c69226cf9afb9a018d12a37fab3a8869db5f6d7f83b6b147d'
            '409b32e546ec4936d0d88e39c59ee68dfd9f630d8c454ce1e3d58243df7ad396')

prepare() {
  cd SuiteSparse-$pkgver
  patch -p1 -i ../suitesparse-no-demo.patch # Don't run demo
}

build() {
  cd SuiteSparse-$pkgver

  BLAS=-lblas LAPACK=-llapack MY_METIS_LIB=/usr/lib/libmetis.so make
}


package() {
  cd SuiteSparse-$pkgver
  install -dm755 "${pkgdir}"/usr/{include,lib}

  BLAS=-lblas LAPACK=-llapack MY_METIS_LIB=/usr/lib/libmetis.so \
  make INSTALL_LIB="${pkgdir}"/usr/lib INSTALL_INCLUDE="${pkgdir}"/usr/include install

  # fix RPATH
  chrpath -d "$pkgdir"/usr/lib/*
}
