# $Id$
# Maintainer: damir <damir@archlinux.org>
# Community Maintainer: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=blas
pkgver=19980702
pkgrel=4
pkgdesc="Basic Linear Algebra Subprograms"
arch=('i686' 'x86_64')
url="http://www.netlib.org/blas"
license=('custom')
depends=('glibc')
source=(http://www.netlib.org/blas/blas.tgz Makefile license.txt)
md5sums=('7e6af7022440d8688d16be86d55fb358' '497f389126aa0440754de491fec5ebae'\
         '38b6acb8ed5691d25863319d30a8b365')

build() {
  cd ${startdir}/src/BLAS
  export FFLAGS="${CFLAGS}"
  if [ "${CARCH}" = "x86_64" ]; then
    FFLAGS="${FFLAGS} -fPIC"
  fi
  cp ${startdir}/src/Makefile ${startdir}/src/BLAS/
  FC="gfortran" FFLAGS="${FFLAGS}" make static shared || return 1

  install -D -m644 libblas.a ${startdir}/pkg/usr/lib/libblas.a
  install -D -m755 libblas.so.3.0.3 ${startdir}/pkg/usr/lib/libblas.so.3.0.3
  ln -s libblas.so.3.0.3 ${startdir}/pkg/usr/lib/libblas.so
  ln -s libblas.so.3.0.3 ${startdir}/pkg/usr/lib/libblas.so.3 
  # install license
  install -m755 -d ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -D -m644 ${startdir}/src/license.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/license.txt
}
