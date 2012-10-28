# $Id$
# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgname=('gcc' 'gcc-libs' 'gcc-fortran' 'gcc-objc' 'gcc-ada' 'gcc-go')
pkgver=4.7.2
pkgrel=2
#_snapshot=4.7-20120721
pkgdesc="The GNU Compiler Collection"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
makedepends=('binutils>=2.23' 'libmpc' 'cloog' 'ppl' 'gcc-ada' 'doxygen')
checkdepends=('dejagnu')
options=('!libtool' '!emptydirs')
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2
	#ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-${_snapshot}.tar.bz2
	gcc_pure64.patch
	gcc-4.7.1-libada-pic.patch
	gcc-4.7.1-libgo-write.patch)
md5sums=('cc308a0891e778cfda7a151ab8a6e762'
         'ced48436c1b3c981d721a829f1094de1'
         '2acbc9d35cc9d72329dc71d6b1f162ef'
         'df82dd175ac566c8a6d46b11ac21f14c')


if [ -n "${_snapshot}" ]; then
  _basedir="${srcdir}/gcc-${_snapshot}"
else
  _basedir="${srcdir}/gcc-${pkgver}"
fi

build() {
  cd ${_basedir}

  # Do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  if [ "${CARCH}" = "x86_64" ]; then
    patch -p1 -i ${srcdir}/gcc_pure64.patch
  fi

  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=53679
  patch -p1 -i ${srcdir}/gcc-4.7.1-libgo-write.patch
  
  # bug to file...
  patch -p1 -i ${srcdir}/gcc-4.7.1-libada-pic.patch

  echo ${pkgver} > gcc/BASE-VER

  cd ${srcdir}
  mkdir gcc-build && cd gcc-build

  ${_basedir}/configure --prefix=/usr \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,ada,fortran,go,lto,objc,obj-c++ \
      --enable-shared --enable-threads=posix \
      --with-system-zlib --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch --enable-libstdcxx-time \
      --enable-gnu-unique-object --enable-linker-build-id \
      --with-ppl --enable-cloog-backend=isl \
      --disable-ppl-version-check --disable-cloog-version-check \
      --enable-lto --enable-gold --enable-ld=default \
      --enable-plugin --with-plugin-ld=ld.gold \
      --with-linker-hash-style=gnu \
      --disable-multilib --disable-libssp \
      --disable-build-with-cxx --disable-build-poststage1-with-cxx \
      --enable-checking=release
  make
  
  # make documentation
  cd $CHOST/libstdc++-v3
  make doc-man-doxygen
}

check() {
  cd ${srcdir}/gcc-build

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  ulimit -s 32768

  # do not abort on error as some are "expected"
  make -k check || true
  ${_basedir}/contrib/test_summary
}

package_gcc-libs()
{
  pkgdesc="Runtime libraries shipped by GCC"
  groups=('base')
  depends=('glibc>=2.16')
  install=gcc-libs.install

  cd ${srcdir}/gcc-build
  make -j1 -C $CHOST/libgcc DESTDIR=${pkgdir} install-shared
  for lib in libmudflap libgomp libstdc++-v3/src libitm; do
    make -j1 -C $CHOST/$lib DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES
  done
  make -j1 -C $CHOST/libstdc++-v3/po DESTDIR=${pkgdir} install
  make -j1 -C $CHOST/libgomp DESTDIR=${pkgdir} install-info
  make -j1 -C $CHOST/libitm DESTDIR=${pkgdir} install-info

  make -j1 DESTDIR=${pkgdir} install-target-libquadmath  
  make -j1 DESTDIR=${pkgdir} install-target-libgfortran
  make -j1 DESTDIR=${pkgdir} install-target-libobjc

  # remove unnecessary files installed by install-target-{libquadmath,libgfortran,libobjc}
  rm -r ${pkgdir}/usr/lib/{gcc/,libgfortran.spec}

  # remove static libraries
  find ${pkgdir} -name *.a -delete
  
  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc()
{
  pkgdesc="The GNU Compiler Collection - C and C++ frontends"
  depends=("gcc-libs=$pkgver-$pkgrel" 'binutils>=2.23' 'libmpc' 'cloog' 'ppl')
  groups=('base-devel')
  install=gcc.install

  cd ${srcdir}/gcc-build
  
  make -j1 DESTDIR=${pkgdir} install

  install -d $pkgdir/usr/share/gdb/auto-load/usr/lib
  mv $pkgdir{,/usr/share/gdb/auto-load}/usr/lib/libstdc++.so.6.0.17-gdb.py

  # unfortunately it is much, much easier to install the lot and clean-up the mess...
  rm $pkgdir/usr/bin/{{$CHOST-,}gfortran,{$CHOST-,}gccgo,gnat*}
  rm $pkgdir/usr/lib/*.so*
  rm $pkgdir/usr/lib/lib{ffi,gfortran,go{,begin},objc,quadmath}.a
  rm $pkgdir/usr/lib/libgfortran.spec
  rm -r $pkgdir/usr/lib/gcc/$CHOST/${pkgver}/{ada{include,lib},finclude,include/objc}
  rm $pkgdir/usr/lib/gcc/$CHOST/${pkgver}/include/{ffi{,target}.h,quadmath{,_weak}.h}
  rm $pkgdir/usr/lib/gcc/$CHOST/${pkgver}/{cc1obj{,plus},f951,gnat1,go1}
  rm $pkgdir/usr/lib/gcc/$CHOST/${pkgver}/{libcaf_single,libgfortranbegin}.a
  rm -r $pkgdir/usr/lib/go
  rm $pkgdir/usr/share/info/{gccgo,gfortran,gnat*,libgomp,libquadmath,libitm}.info
  rm $pkgdir/usr/share/locale/{de,fr}/LC_MESSAGES/libstdc++.mo
  rm $pkgdir/usr/share/man/man1/{gccgo,gfortran}.1
  rm $pkgdir/usr/share/man/man3/ffi*

  # many packages expect this symlinks
  ln -s gcc ${pkgdir}/usr/bin/cc

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
  install -m644 -t ${pkgdir}/usr/share/man/man3 \
    ${CHOST}/libstdc++-v3/doc/doxygen/man/man3/*.3

  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-fortran()
{
  pkgdesc="Fortran front-end for GCC"
  depends=("gcc=$pkgver-$pkgrel")
  install=gcc-fortran.install

  cd ${srcdir}/gcc-build
  make -j1 DESTDIR=${pkgdir} install-target-libquadmath
  make -j1 DESTDIR=$pkgdir install-target-libgfortran
  make -j1 -C $CHOST/libgomp DESTDIR=$pkgdir install-nodist_fincludeHEADERS
  make -j1 -C gcc DESTDIR=$pkgdir fortran.install-{common,man,info}
  install -Dm755 gcc/f951 $pkgdir/usr/lib/gcc/$CHOST/$pkgver/f951
  
  # remove libraries included in gcc-libs
  rm ${pkgdir}/usr/lib/lib{gfortran,quadmath}.so*
  rm ${pkgdir}/usr/share/info/libquadmath.info

  ln -s gfortran ${pkgdir}/usr/bin/f95

  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-fortran/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-objc()
{
  pkgdesc="Objective-C front-end for GCC"
  depends=("gcc=$pkgver-$pkgrel")

  cd ${srcdir}/gcc-build
  make -j1 DESTDIR=$pkgdir install-target-libobjc
  install -dm755 $pkgdir/usr/lib/gcc/$CHOST/$pkgver/
  install -m755 gcc/cc1obj{,plus} $pkgdir/usr/lib/gcc/$CHOST/$pkgver/

  # remove libraries included in gcc-libs
  rm ${pkgdir}/usr/lib/libobjc.so*

  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-objc/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-ada()
{
  pkgdesc="Ada front-end for GCC (GNAT)"
  depends=("gcc=$pkgver-$pkgrel")
  install=gcc-ada.install

  cd ${srcdir}/gcc-build/gcc
  make -j1 DESTDIR=$pkgdir ada.install-{common,info}
  install -m755 gnat1 $pkgdir/usr/lib/gcc/$CHOST/$pkgver

  ln -s gcc ${pkgdir}/usr/bin/gnatgcc
  
  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-ada/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc-go()
{
  pkgdesc="Go front-end for GCC"
  depends=("gcc=$pkgver-$pkgrel")
  install=gcc-go.install

  cd ${srcdir}/gcc-build
  make -j1 DESTDIR=$pkgdir install-target-libgo
  make -j1 -C gcc DESTDIR=$pkgdir go.install-{common,man,info}
  install -Dm755 gcc/go1 $pkgdir/usr/lib/gcc/$CHOST/$pkgver/go1

  # Install Runtime Library Exception
  install -Dm644 ${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-go/RUNTIME.LIBRARY.EXCEPTION
}
