# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Andreas Radke <andyrtr@archlinux.org>

pkgname=gcc
pkgver=4.3.1
pkgrel=1
#_snapshot=4.2.3-RC-20080125
pkgdesc="The GNU Compiler Collection"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
groups=('base-devel')
url="http://gcc.gnu.org"
depends=('binutils>=2.18-7' "gcc-libs>=${pkgver}" 'mpfr>=2.3.1')
makedepends=('texinfo')
replaces=('gcc-fortran' 'gcc-objc')
options=('!libtool')
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-{core,g++,fortran,objc,java}-${pkgver}.tar.bz2
	#ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-{core,g++,fortran,objc}-${_snapshot}.tar.bz2
	ftp://gcc.gnu.org/pub/gcc/libstdc++/doxygen/libstdc++-man-20080118.tar.bz2
	gcc_pure64.patch
	gcc-hash-style-both.patch
	gcc-java-driver.patch)
md5sums=('f30652bdee577911681c86f5d7f23d65'
         '1e0eadf92c2aeff4611fe9da286348d4'
         '6b328dc169dde6c8d290505314f8a500'
         '94353db338ac174a9ce6533ae78acbcd'
         '1987df86bd860ea9b7d9c7668d6ad5e3'
         '990881456a89b1ffbd68d2d7188759da'
         '4030ee1c08dd1e843c0225b772360e76'
         'bb420bc84b1104455b7230b1cd4b96c2'
         'c82665e579850eb37cdee8349d614dbe')

build() {
  if ! locale -a | grep ^de_DE; then
    echo "You need the de_DE locale to build gcc."
    return 1
  fi
  
  cd ${startdir}/src/gcc-${pkgver}
  #cd ${startdir}/src/gcc-${_snapshot}
  # Don't install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

  if [ "${CARCH}" = "x86_64" ]; then
    patch -Np1 -i ../gcc_pure64.patch || return 1
  fi
  patch -Np0 -i ${startdir}/src/gcc-hash-style-both.patch || return 1
  patch -Np0 -i ${startdir}/src/gcc-java-driver.patch || return 1

  mkdir build
  cd build
  ../configure --prefix=/usr --enable-shared \
      --enable-languages=c,c++,fortran,objc,obj-c++,treelang \
      --enable-threads=posix --mandir=/usr/share/man \
      --enable-__cxa_atexit  --disable-multilib --libdir=/usr/lib \
      --libexecdir=/usr/lib --enable-clocale=gnu --disable-libstdcxx-pch \
      --with-tune=generic
  make || return 1
  make -j1 DESTDIR=${startdir}/pkg install || return 1
  mkdir -p ${startdir}/pkg/lib
  ln -sf ../usr/bin/cpp ${startdir}/pkg/lib/cpp
  ln -sf gcc ${startdir}/pkg/usr/bin/cc
  ln -sf g++ ${startdir}/pkg/usr/bin/c++

  # install the libstdc++ man pages
  mkdir -p ${startdir}/pkg/usr/share/man/man3
  install -m644 ${startdir}/src/man/man3/* ${startdir}/pkg/usr/share/man/man3/

  # Remove libraries and translations in gcc-libs
  rm -f ${startdir}/pkg/usr/lib/lib*
  find ${startdir}/pkg -name libstdc++.mo -delete

  # Remove fixed includes, either no need for them, or they're not complete
  rm -rf ${startdir}/pkg/usr/lib/${CHOST}/${pkgver}/include-fixed/*
}
