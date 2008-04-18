# $Id$
# Maintainer: Damir Perisa <damir.perisa@bluewin.ch>
# Contributor: K. Piche <kpiche@rogers.com>

pkgname=r
pkgver=2.6.2
pkgrel=1
pkgdesc="R is a language and environment for statistical computing and graphics"
arch=("i686" "x86_64")
license=('GPL')
url=('http://www.r-project.org/')
depends=('blas>=19980702-4' 'lapack>=3.1.1-3' 'bzip2'  'libpng' 'libjpeg' 'ncurses' 'pcre' 'readline' 'zlib' 'perl' 'gcc-libs>=4.3.0' 'tk' 'libxt' 'libxmu')
makedepends=('java-gcj-compat')
source=(http://cran.r-project.org/src/base/R-2/R-${pkgver}.tar.gz
	r.desktop
	r.png)
md5sums=('1099cbf02c624ceb459d9bbc4d0d1448' 'f6d54d32e510d90c748a0d16d2abcbdc'\
         '00659f39e90627fe87f1645df5d4e3a7')

build() {
   cd ${startdir}/src/R-${pkgver}
   sed -i 's|#define NeedFunctionPrototypes 0|#define NeedFunctionPrototypes 1|g' src/modules/X11/dataentry.c || return 1
   ./configure  --prefix=/usr \
		--libdir=/usr/lib \
		--datarootdir=/usr/share \
		  rsharedir=/usr/share/R/ \
		  rincludedir=/usr/include/R/ \
		  rdocdir=/usr/share/R/docs/ \
                --with-gnu-ld \
		--with-readline \
                --with-x \
                --with-zlib \
                --with-bzlib  \
                --with-pcre \
		--enable-R-shlib \
                --with-lapack \
		--with-blas \
                F77=gfortran \
		LIBnn=lib
   make || return 1
   make -j1 DESTDIR=${startdir}/pkg/ install || return 1

   #  Fixup R wrapper scripts.
   sed -i "s|${startdir}/pkg||" ${startdir}/pkg/usr/bin/R
   rm ${startdir}/pkg/usr/lib/R/bin/R
   cd ${startdir}/pkg/usr/lib/R/bin
   ln -s ../../../bin/R

  # install some freedesktop.org compatibility
  install -m755 -d ${startdir}/pkg/usr/share/applications
  install -m755 -d ${startdir}/pkg/usr/share/pixmaps
  install -m644 ${startdir}/src/r.desktop ${startdir}/pkg/usr/share/applications/ || return 1
  install -m644 ${startdir}/src/r.png ${startdir}/pkg/usr/share/pixmaps/ || return 1
 }


# R is now configured for x86_64-unknown-linux-gnu
# 
#   Source directory:          .
#   Installation directory:    /usr
# 
#   C compiler:                gcc -std=gnu99  -march=x86-64 -mtune=generic -O2 -pipe
#   Fortran 77 compiler:       gfortran  -g -O2
# 
#   C++ compiler:              g++  -march=x86-64 -mtune=generic -O2 -pipe
#   Fortran 90/95 compiler:    gfortran -g -O2
#   Obj-C compiler:
# 
#   Interfaces supported:      X11, tcltk
#   External libraries:        readline, BLAS(generic), LAPACK(generic)
#   Additional capabilities:   PNG, JPEG, iconv, MBCS, NLS
#   Options enabled:           shared R library, R profiling, Java
# 
#   Recommended packages:      yes





