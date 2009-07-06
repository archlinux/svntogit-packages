# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: kernel-headers->glibc->binutils->gcc-libs->gcc->binutils->glibc

pkgname=gcc
pkgver=4.4.0
pkgrel=5
_snapshot=4.4-20090630
_libstdcppmanver=4.4.0
pkgdesc="The GNU Compiler Collection"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'custom')
groups=('base-devel')
url="http://gcc.gnu.org"
depends=('binutils>=2.19.1' "gcc-libs=${pkgver}-${pkgrel}" 'mpfr>=2.4.1' 'cloog-ppl>=0.15.3')
makedepends=('flex')
replaces=('gcc-fortran' 'gcc-objc')
options=('!libtool')
install=gcc.install
source=(#ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-{core,g++,fortran,objc}-${pkgver}.tar.bz2
	ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-{core,g++,fortran,objc}-${_snapshot}.tar.bz2
	ftp://gcc.gnu.org/pub/gcc/libstdc++/doxygen/libstdc++-man.${_libstdcppmanver}.tar.bz2
	#ftp://ftp.archlinux.org/other/${pkgname}/libstdc++-man.${_libstdcppmanver}.tar.bz2
	gcc_pure64.patch
	gcc-hash-style-both.patch)
md5sums=('e89e0c073a9d33f266cddaa4db619da9'
         '5802117b7cf1000e5bdc09f60bfdb8b8'
         '445a463969f3f2308e570a18f7a9ecd7'
         '34f678a156605b0be6efab104667970e'
         '3b94fe4a3cd49819bf57ecc407851b9b'
         '4030ee1c08dd1e843c0225b772360e76'
         '6fd395bacbd7b6e47c7b74854b478363')

build() {
  if ! locale -a | grep ^de_DE; then
    echo "You need the de_DE locale to build gcc."
    return 1
  fi
  
  #cd ${srcdir}/gcc-${pkgver}
  cd ${srcdir}/gcc-${_snapshot}
  # Don't install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

  if [ "${CARCH}" = "x86_64" ]; then
    patch -Np1 -i ../gcc_pure64.patch || return 1
  fi
  patch -Np0 -i ${srcdir}/gcc-hash-style-both.patch || return 1

  echo ${pkgver} > gcc/BASE-VER

  mkdir build
  cd build
  ../configure --prefix=/usr --enable-shared \
      --enable-languages=c,c++,fortran,objc,obj-c++ \
      --enable-threads=posix --mandir=/usr/share/man --infodir=/usr/share/info \
      --enable-__cxa_atexit  --disable-multilib --libdir=/usr/lib \
      --libexecdir=/usr/lib --enable-clocale=gnu --disable-libstdcxx-pch \
      --with-tune=generic
  make || return 1
  make -j1 DESTDIR=${pkgdir} install || return 1
  install -dm755 ${pkgdir}/lib
  ln -sf ../usr/bin/cpp ${pkgdir}/lib/cpp
  ln -sf gcc ${pkgdir}/usr/bin/cc
  ln -sf g++ ${pkgdir}/usr/bin/c++

  # install the libstdc++ man pages
  install -dm755 ${pkgdir}/usr/share/man/man3
  install -m644 ${srcdir}/libstdc++-man-${_libstdcppmanver}/man3/* \
    ${pkgdir}/usr/share/man/man3/
  # deal with conflicts...
  rm -f ${pkgdir}/usr/share/man/man3/{ctime,queue,random,regex,string}.3

  # Remove libraries and translations in gcc-libs
  rm -f ${pkgdir}/usr/lib/lib*
  find ${pkgdir} -name libstdc++.mo -delete

  # Remove fixed includes, either no need for them, or they're not complete
  rm -rf ${pkgdir}/usr/lib/${CHOST}/${pkgver}/include-fixed/*

  # Install Runtime Library Exception
  install -Dm644 ../COPYING.RUNTIME ${pkgdir}/usr/share/licenses/gcc/RUNTIME.LIBRARY.EXCEPTION

  rm -f ${pkgdir}/usr/share/info/dir
  gzip -9 ${pkgdir}/usr/share/info/*
}
