# Maintainer: Ronald van Haren <ronald.archlinux.org>

pkgname=suitesparse
pkgver=5.7.1
pkgrel=1
pkgdesc="A collection of sparse matrix libraries"
url="http://faculty.cse.tamu.edu/davis/suitesparse.html"
arch=('x86_64')
conflicts=('umfpack')
provides=('umfpack')
replaces=('umfpack')
depends=('metis' 'lapack' 'intel-tbb')
makedepends=('gcc-fortran' 'cmake' 'chrpath')
license=('GPL')
options=('staticlibs')
source=($pkgname-$pkgver.tar.gz::"https://github.com/DrTimothyAldenDavis/SuiteSparse/archive/v$pkgver.tar.gz"
        suitesparse-no-demo.patch)
sha256sums=('5ba5add1663d51a1b6fb128b50fe869b497f3096765ff7f8212f0ede044b9557'
            'f80488bb076753d38ea21d207bd682bdc97e21220c733da025f518a5b7e8e030')

prepare() {
  cd SuiteSparse-$pkgver
  patch -p1 -i ../suitesparse-no-demo.patch
}

build() {
  cd SuiteSparse-$pkgver

  BLAS=-lblas TBB=-ltbb SPQR_CONFIG=-DHAVE_TBB MY_METIS_LIB=/usr/lib/libmetis.so make
}


package() {
  cd SuiteSparse-$pkgver
  install -dm755 "${pkgdir}"/usr/{include,lib}

  BLAS=-lblas TBB=-ltbb SPQR_CONFIG=-DHAVE_TBB MY_METIS_LIB=/usr/lib/libmetis.so \
  make INSTALL_LIB="${pkgdir}"/usr/lib INSTALL_INCLUDE="${pkgdir}"/usr/include install

  # fix RPATH
  chrpath -d "$pkgdir"/usr/lib/*
}

