# $Id$
# Maintainer: damir <damir@archlinux.org>

pkgname=fftw
pkgver=3.1.2
pkgrel=2
pkgdesc="FFTW is a C subroutine library for computing the discrete Fourier transform (DFT) in one or more dimensions, of both real and complex data, and of arbitrary input size."
arch=("i686" "x86_64")
license=('GPL2')
url="http://www.fftw.org/"
depends=('glibc')
provides=('fftw3')
options=(!libtool)
source=(http://www.fftw.org/${pkgname}-${pkgver}.tar.gz)
md5sums=('08f2e21c9fd02f4be2bd53a62592afa4')

# http://www.fftw.org/fftw2_doc/fftw_6.html#SEC69
# http://www.fftw.org/faq/section2.html#singleprec
# http://www.fftw.org/fftw3_doc/Precision.html#Precision

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  # build + install double precision
  ./configure F77=gfortran \
              --prefix=/usr \
              --enable-type-prefix \
	      --enable-shared
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1

  make clean

  # build + install single precision
  ./configure F77=gfortran \
              --prefix=/usr \
              --enable-float \
	      --enable-type-prefix \
	      --enable-shared
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
