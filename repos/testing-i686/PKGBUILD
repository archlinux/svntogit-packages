# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=gcc
pkgver=4.3.1
pkgrel=2
_snapshot=4.3-20080626
pkgdesc="The GNU Compiler Collection"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
groups=('base-devel')
url="http://gcc.gnu.org"
depends=('binutils>=2.18-8' "gcc-libs>=${pkgver}" 'mpfr>=2.3.1')
makedepends=('texinfo')
replaces=('gcc-fortran' 'gcc-objc')
options=('!libtool')
source=(#ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-{core,g++,fortran,objc,java}-${pkgver}.tar.bz2
	ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-{core,g++,fortran,objc,java}-${_snapshot}.tar.bz2
	ftp://gcc.gnu.org/pub/gcc/libstdc++/doxygen/libstdc++-man-20080118.tar.bz2
	gcc_pure64.patch
	gcc-hash-style-both.patch
	gcc-java-driver.patch)
md5sums=('1b2112da8bdc700d0e095b55b98911e5'
         '300196b968ab718afa2b340c810cf4c8'
         '3dc1f56795f981b333125d45a47250da'
         'f24df07e1aae5ae2b80ef88bc562bd03'
         '4b3edf7d6eaf1f4bf193e3df0e6e621e'
         '990881456a89b1ffbd68d2d7188759da'
         '4030ee1c08dd1e843c0225b772360e76'
         'bb420bc84b1104455b7230b1cd4b96c2'
         'c82665e579850eb37cdee8349d614dbe')

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
  patch -Np0 -i ${srcdir}/gcc-java-driver.patch || return 1

  echo ${pkgver} > gcc/BASE-VER

  mkdir build
  cd build
  ../configure --prefix=/usr --enable-shared \
      --enable-languages=c,c++,fortran,objc,obj-c++,treelang \
      --enable-threads=posix --mandir=/usr/share/man \
      --enable-__cxa_atexit  --disable-multilib --libdir=/usr/lib \
      --libexecdir=/usr/lib --enable-clocale=gnu --disable-libstdcxx-pch \
      --with-tune=generic
  make || return 1
  make -j1 DESTDIR=${pkgdir} install || return 1
  mkdir -p ${pkgdir}/lib
  ln -sf ../usr/bin/cpp ${pkgdir}/lib/cpp
  ln -sf gcc ${pkgdir}/usr/bin/cc
  ln -sf g++ ${pkgdir}/usr/bin/c++

  # install the libstdc++ man pages
  mkdir -p ${pkgdir}/usr/share/man/man3
  install -m644 ${srcdir}/man/man3/* ${pkgdir}/usr/share/man/man3/

  # Remove libraries and translations in gcc-libs
  rm -f ${pkgdir}/usr/lib/lib*
  find ${pkgdir} -name libstdc++.mo -delete

  # Remove fixed includes, either no need for them, or they're not complete
  rm -rf ${pkgdir}/usr/lib/${CHOST}/${pkgver}/include-fixed/*
}
