# $Id$
# Maintainer: Tobias Powalowski <tpowa@archlinux.org>

pkgname=cfitsio
pkgver=3060
pkgrel=2
pkgdesc="CFITSIO is a library of C and Fortran subroutines for reading and writing data files in FITS (Flexible Image Transport System) data format."
url="http://heasarc.gsfc.nasa.gov/docs/software/fitsio/fitsio.html"
license=('GPL2')
arch=('i686' 'x86_64')
makedepends=('pkgconfig')
source=(ftp://heasarc.gsfc.nasa.gov/software/fitsio/c/${pkgname}${pkgver}.tar.gz)
options=(!libtool)
md5sums=('b7ab291d227c60b17a19a1c028dc649c')

build() {
  cd ${startdir}/src/${pkgname}
  ./configure --prefix=/usr
  make || return 1
  #fix Makefile for install dir
  sed -i -e "s#/usr#${startdir}/pkg/usr#g" Makefile
  mkdir -p ${startdir}/pkg/usr/lib/pkgconfig
  make install || return 1
}
