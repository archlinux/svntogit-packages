# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgname=('gcc' 'gcc-libs' 'gcc-fortran' 'gcc-objc' 'gcc-ada')
pkgver=4.5.0
pkgrel=6
_snapshot=4.5-20100610
_libstdcppmanver=20100312	# Note: check source directory name when updating this
pkgdesc="The GNU Compiler Collection"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'custom')
url="http://gcc.gnu.org"
makedepends=('binutils>=2.20.1' 'libmpc>=0.8.2-2' 'cloog-ppl>=0.15.8' 'libelf' 'gcc-ada')
options=('!libtool' '!emptydirs')
source=(#ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-{core,g++,fortran,objc,ada}-${pkgver}.tar.bz2
	ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-{core,g++,fortran,objc,ada}-${_snapshot}.tar.bz2
	ftp://gcc.gnu.org/pub/gcc/libstdc++/doxygen/libstdc++-man.${_libstdcppmanver}.tar.bz2
	gcc_pure64.patch
	gcc-hash-style-both.patch
	r160561.patch)
md5sums=('d0c6573f18e61d0a6c6fe742066346cd'
         '4c5369d27b8cb4c4e447553f064d0f16'
         '2c191ab600e600c774a65674c542e210'
         'a569128d6daf741b242e39f5c24debe4'
         'a7527896c33759ccc40bb82173f8f27f'
         'f9a21b9dfc174f49a09ddaacfd3ac78f'
         '4030ee1c08dd1e843c0225b772360e76'
         '6fd395bacbd7b6e47c7b74854b478363'
         '79cb26e66eb2502171ef69438fa8666d')

if [ -n "${_snapshot}" ]; then
  _basedir="${srcdir}/gcc-${_snapshot}"
else
  _basedir="${srcdir}/gcc-${pkgver}"
fi

build() {
  if ! locale -a | grep ^de_DE > /dev/null; then
    echo "You need the de_DE locale to build gcc."
    return 1
  fi
  
  cd ${_basedir}

  # Do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  if [ "${CARCH}" = "x86_64" ]; then
    patch -Np1 -i ../gcc_pure64.patch || return 1
  fi
  patch -Np0 -i ${srcdir}/gcc-hash-style-both.patch || return 1

  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44258
  patch -Np1 -i ${srcdir}/r160561.patch || return 1

  echo ${pkgver} > gcc/BASE-VER

  mkdir build && cd build      
  ../configure --prefix=/usr --enable-languages=c,c++,fortran,objc,obj-c++,ada \
      --enable-shared --enable-threads=posix --enable-__cxa_atexit \
      --enable-clocale=gnu --enable-gnu-unique-object \
      --enable-lto --enable-plugin \
      --disable-multilib --disable-libstdcxx-pch \
      --with-system-zlib --with-ppl --with-cloog \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info
  make || return 1
}

package_gcc-libs()
{
  pkgdesc="Runtime libraries shipped by GCC for C and C++ languages"
  groups=('base')
  depends=('glibc>=2.11.1-2')
  install=gcc-libs.install

  cd ${_basedir}/build
  make -j1 -C $CHOST/libgcc DESTDIR=${pkgdir} install-shared
  for lib in libmudflap libgomp libssp libstdc++-v3/src; do
    make -j1 -C $CHOST/$lib DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES
  done
  make -j1 -C $CHOST/libstdc++-v3/po DESTDIR=${pkgdir} install
  make -j1 -C $CHOST/libgomp DESTDIR=${pkgdir} install-info

  make -j1 DESTDIR=${pkgdir} install-target-libgfortran

  make -j1 DESTDIR=${pkgdir} install-target-libobjc
  # I thought I said to only install the lib...
  rm -rf ${pkgdir}/usr/lib/gcc/

  # remove static libraries
  find ${pkgdir} -name *.a -delete
  
  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc()
{
  depends=('binutils>=2.20.1' 'libmpc>=0.8.1-2' 'cloog-ppl>=0.15.8' 'libelf')
  groups=('base-devel')
  install=gcc.install

  cd ${_basedir}/build
  
  # much, much easier to install the lot and clean-up the mess
  make -j1 DESTDIR=${pkgdir} install || return 1
  rm $pkgdir/usr/bin/{*gfortran,gnat*}
  rm $pkgdir/usr/lib/gcc/$CHOST/${pkgver}/{ada{include,lib},finclude,include/objc}/*
  rm $pkgdir/usr/lib/gcc/$CHOST/${pkgver}/{cc1obj{,plus},f951,gnat1,libgfortranbegin.a}
  rm $pkgdir/usr/lib/{*.so*,lib{gfortran,objc}.a}
  rm $pkgdir/usr/share/info/{gfortran,gnat*,libgomp}.info
  rm $pkgdir/usr/share/locale/{de,fr}/LC_MESSAGES/libstdc++.mo
  rm $pkgdir/usr/share/man/man1/gfortran.1

  # many packages require these symlinks
  install -dm755 ${pkgdir}/lib
  ln -sf /usr/bin/cpp ${pkgdir}/lib/cpp
  ln -sf gcc ${pkgdir}/usr/bin/cc
  ln -sf g++ ${pkgdir}/usr/bin/c++

  # POSIX conformance launcher scripts for c89 and c99
  cat > $pkgdir/usr/bin/c89 <<"EOF"
#!/bin/sh
fl="-std=c89"
for opt; do
  case "$opt" in
    -ansi|-std=c89|-std=iso9899:1990) fl="";;
    -std=*) echo "`basename $0` called with non ANSI/ISO C option $opt" >&2
	    exit 1;;
  esac
done
exec gcc $fl ${1+"$@"}
EOF

  cat > $pkgdir/usr/bin/c99 <<"EOF"
#!/bin/sh
fl="-std=c99"
for opt; do
  case "$opt" in
    -std=c99|-std=iso9899:1999) fl="";;
    -std=*) echo "`basename $0` called with non ISO C99 option $opt" >&2
	    exit 1;;
  esac
done
exec gcc $fl ${1+"$@"}
EOF

  chmod 755 $pkgdir/usr/bin/c{8,9}9

  # install the libstdc++ man pages
  install -dm755 ${pkgdir}/usr/share/man/man3
  install -m644 ${srcdir}/libstdc++-man.${_libstdcppmanver}/man3/* \
    ${pkgdir}/usr/share/man/man3/
  # deal with conflicts...
  rm -f ${pkgdir}/usr/share/man/man3/{ctime,queue,random,regex,string}.3

  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-fortran()
{
  pkgdesc="Fortran front-end for GCC"
  depends=("gcc=$pkgver-$pkgrel")
  install=gcc-fortran.install

  cd ${_basedir}/build
  make -j1 DESTDIR=$pkgdir install-target-libgfortran
  make -j1 -C $CHOST/libgomp DESTDIR=$pkgdir install-nodist_fincludeHEADERS
  make -j1 -C gcc DESTDIR=$pkgdir fortran.install-{common,man,info}
  install -Dm755 gcc/f951 $pkgdir/usr/lib/gcc/$CHOST/$pkgver/f951
  
  # remove libraries included in gcc-libs
  rm -f ${pkgdir}/usr/lib/libgfortran.so*
  
  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-fortran/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-objc()
{
  pkgdesc="Objective-C front-end for GCC"
  depends=("gcc=$pkgver-$pkgrel")

  cd ${_basedir}/build
  make -j1 DESTDIR=$pkgdir install-target-libobjc
  install -dm755 $pkgdir/usr/lib/gcc/$CHOST/$pkgver/
  install -m755 gcc/cc1obj{,plus} $pkgdir/usr/lib/gcc/$CHOST/$pkgver/

  # remove libraries included in gcc-libs
  rm -f ${pkgdir}/usr/lib/libobjc.so*

  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-objc/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-ada()
{
  pkgdesc="Ada front-end for GCC (GNAT)"
  depends=("gcc=$pkgver-$pkgrel")
  install=gcc-ada.install

  cd ${_basedir}/build/gcc
  make -j1 DESTDIR=$pkgdir ada.install-{common,info}
  install -m755 gnat1 $pkgdir/usr/lib/gcc/$CHOST/$pkgver
  
  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-ada/RUNTIME.LIBRARY.EXCEPTION
}
