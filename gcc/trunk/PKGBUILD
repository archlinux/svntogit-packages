# $Id$
# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: libtool requires rebuilt with each new gcc version

pkgname=('gcc' 'gcc-libs' 'gcc-fortran' 'gcc-objc' 'gcc-ada' 'gcc-go')
pkgver=4.9.0
_pkgver=4.9
pkgrel=4
_snapshot=4.9-20140604
pkgdesc="The GNU Compiler Collection"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL' 'FDL' 'custom')
url="http://gcc.gnu.org"
makedepends=('binutils>=2.24' 'libmpc' 'cloog' 'gcc-ada' 'doxygen')
checkdepends=('dejagnu' 'inetutils')
options=('!emptydirs')
source=(#ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2
        ftp://gcc.gnu.org/pub/gcc/snapshots/${_snapshot}/gcc-${_snapshot}.tar.bz2
        gcc-4.8-filename-output.patch)
md5sums=('57aa4ff81c56262dc89994853c4d0149'
         '40cb437805e2f7a006aa0d0c3098ab0f')

if [ -n "${_snapshot}" ]; then
  _basedir=gcc-${_snapshot}
else
  _basedir=gcc-${pkgver}
fi

_libdir="usr/lib/gcc/$CHOST/$pkgver"

prepare() {
  cd ${srcdir}/${_basedir}

  # Do not run fixincludes
  sed -i 's@\./fixinc\.sh@-c true@' gcc/Makefile.in

  # Arch Linux installs x86_64 libraries /lib
  [[ $CARCH == "x86_64" ]] && sed -i '/m64=/s/lib64/lib/' gcc/config/i386/t-linux64

  echo ${pkgver} > gcc/BASE-VER

  # hack! - some configure tests for header files using "$CPP $CPPFLAGS"
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" {libiberty,gcc}/configure

  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=57653
  patch -p0 -i ${srcdir}/gcc-4.8-filename-output.patch

  mkdir ${srcdir}/gcc-build
}

build() {
  cd ${srcdir}/gcc-build

  # using -pipe causes spurious test-suite failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48565
  CFLAGS=${CFLAGS/-pipe/}
  CXXFLAGS=${CXXFLAGS/-pipe/}

  ${srcdir}/${_basedir}/configure --prefix=/usr \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --mandir=/usr/share/man --infodir=/usr/share/info \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-languages=c,c++,ada,fortran,go,lto,objc,obj-c++ \
      --enable-shared --enable-threads=posix \
      --with-system-zlib --enable-__cxa_atexit \
      --disable-libunwind-exceptions --enable-clocale=gnu \
      --disable-libstdcxx-pch --disable-libssp \
      --enable-gnu-unique-object --enable-linker-build-id \
      --enable-cloog-backend=isl --disable-cloog-version-check \
      --enable-lto --enable-plugin --enable-install-libiberty \
      --with-linker-hash-style=gnu \
      --disable-multilib --disable-werror \
      --enable-checking=release
  make
  
  # make documentation
  make -C $CHOST/libstdc++-v3/doc doc-man-doxygen
}

check() {
  cd ${srcdir}/gcc-build

  # increase stack size to prevent test failures
  # http://gcc.gnu.org/bugzilla/show_bug.cgi?id=31827
  ulimit -s 32768

  # do not abort on error as some are "expected"
  make -k check || true
  ${srcdir}/${_basedir}/contrib/test_summary
}

package_gcc-libs()
{
  pkgdesc="Runtime libraries shipped by GCC"
  groups=('base')
  depends=('glibc>=2.19')
  options=('!emptydirs')
  install=gcc-libs.install

  cd ${srcdir}/gcc-build
  
  make -C $CHOST/libgcc DESTDIR=${pkgdir} install-shared
  rm ${pkgdir}/${_libdir}/libgcc_eh.a
  
  for lib in libatomic \
             libcilkrts \
             libgfortran \
             libgomp \
             libitm \
             libquadmath \
             libsanitizer/{a,l,ub}san \
             libstdc++-v3/src \
             libvtv; do
    make -C $CHOST/$lib DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES
  done

  [[ $CARCH == "x86_64" ]] && \
    make -C $CHOST/libsanitizer/tsan DESTDIR=${pkgdir} install-toolexeclibLTLIBRARIES

  make -C $CHOST/libobjc DESTDIR=${pkgdir} install-libs
  
  make -C $CHOST/libstdc++-v3/po DESTDIR=${pkgdir} install

  for lib in libgomp \
             libitm \
             libquadmath; do
    make -C $CHOST/$lib DESTDIR=${pkgdir} install-info
  done

  # Install Runtime Library Exception
  install -Dm644 ${srcdir}/${_basedir}/COPYING.RUNTIME \
    ${pkgdir}/usr/share/licenses/gcc-libs/RUNTIME.LIBRARY.EXCEPTION
}

package_gcc()
{
  pkgdesc="The GNU Compiler Collection - C and C++ frontends"
  depends=("gcc-libs=$pkgver-$pkgrel" 'binutils>=2.24' 'libmpc' 'cloog')
  groups=('base-devel')
  options=('staticlibs')
  install=gcc.install

  cd ${srcdir}/gcc-build

  make -C gcc DESTDIR=${pkgdir} install-driver install-cpp install-gcc-ar \
    c++.install-common install-headers install-plugin install-lto-wrapper

  install -m755 gcc/gcov $pkgdir/usr/bin/
  install -m755 -t $pkgdir/${_libdir}/ gcc/{cc1,cc1plus,collect2,lto1}

  make -C $CHOST/libgcc DESTDIR=${pkgdir} install
  rm ${pkgdir}/usr/lib/libgcc_s.so*
  
  make -C $CHOST/libstdc++-v3/src DESTDIR=${pkgdir} install
  make -C $CHOST/libstdc++-v3/include DESTDIR=${pkgdir} install
  make -C $CHOST/libstdc++-v3/libsupc++ DESTDIR=${pkgdir} install
  make -C $CHOST/libstdc++-v3/python DESTDIR=${pkgdir} install

  install -d $pkgdir/usr/share/gdb/auto-load/usr/lib
  mv $pkgdir/usr/lib/libstdc++.so.6.*-gdb.py \
    $pkgdir/usr/share/gdb/auto-load/usr/lib/
  rm ${pkgdir}/usr/lib/libstdc++.so*

  make DESTDIR=${pkgdir} install-fixincludes
  make -C gcc DESTDIR=${pkgdir} install-mkheaders
  make -C lto-plugin DESTDIR=${pkgdir} install

  make -C $CHOST/libcilkrts DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS \
    install-nodist_cilkincludeHEADERS
  make -C $CHOST/libgomp DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS \
    install-nodist_libsubincludeHEADERS
  make -C $CHOST/libitm DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C $CHOST/libquadmath DESTDIR=${pkgdir} install-nodist_libsubincludeHEADERS
  make -C $CHOST/libsanitizer DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS
  make -C $CHOST/libsanitizer/asan DESTDIR=${pkgdir} install-nodist_toolexeclibHEADERS

  make -C libiberty DESTDIR=${pkgdir} install
  # install PIC version of libiberty
  install -m644 ${srcdir}/gcc-build/libiberty/pic/libiberty.a ${pkgdir}/usr/lib

  make -C gcc DESTDIR=${pkgdir} install-man install-info
  rm ${pkgdir}/usr/share/man/man1/{gccgo,gfortran}.1
  rm ${pkgdir}/usr/share/info/{gccgo,gfortran,gnat-style,gnat_rm,gnat_ugn}.info

  make -C libcpp DESTDIR=${pkgdir} install
  make -C gcc DESTDIR=${pkgdir} install-po

  # many packages expect this symlink
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
  make -C $CHOST/libstdc++-v3/doc DESTDIR=$pkgdir doc-install-man

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/gcc/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/gcc/
}

package_gcc-fortran()
{
  pkgdesc="Fortran front-end for GCC"
  depends=("gcc=$pkgver-$pkgrel")
  options=('staticlibs' '!emptydirs')
  install=gcc-fortran.install

  cd ${srcdir}/gcc-build
  make -C $CHOST/libgfortran DESTDIR=$pkgdir install-{{caf,my}execlibLTLIBRARIES,toolexeclibDATA}
  make -C $CHOST/libgomp DESTDIR=$pkgdir install-nodist_fincludeHEADERS
  make -C gcc DESTDIR=$pkgdir fortran.install-{common,man,info}
  install -Dm755 gcc/f951 $pkgdir/${_libdir}/f951

  ln -s gfortran ${pkgdir}/usr/bin/f95

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/gcc-fortran/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/gcc-fortran/
}

package_gcc-objc()
{
  pkgdesc="Objective-C front-end for GCC"
  depends=("gcc=$pkgver-$pkgrel")

  cd ${srcdir}/gcc-build
  make DESTDIR=$pkgdir -C $CHOST/libobjc install-headers
  install -dm755 $pkgdir/${_libdir}
  install -m755 gcc/cc1obj{,plus} $pkgdir/${_libdir}/

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/gcc-objc/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/gcc-objc/
}

package_gcc-ada()
{
  pkgdesc="Ada front-end for GCC (GNAT)"
  depends=("gcc=$pkgver-$pkgrel")
  options=('staticlibs' '!emptydirs')
  install=gcc-ada.install

  cd ${srcdir}/gcc-build/gcc
  make DESTDIR=$pkgdir ada.install-{common,info}
  install -m755 gnat1 $pkgdir/${_libdir}

  ln -s gcc ${pkgdir}/usr/bin/gnatgcc

  # insist on dynamic linking, but keep static libraries because gnatmake complains
  mv ${pkgdir}/${_libdir}/adalib/libgna{rl,t}-${_pkgver}.so ${pkgdir}/usr/lib
  ln -s libgnarl-${_pkgver}.so ${pkgdir}/usr/lib/libgnarl.so
  ln -s libgnat-${_pkgver}.so ${pkgdir}/usr/lib/libgnat.so
  rm ${pkgdir}/${_libdir}/adalib/libgna{rl,t}.so

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/gcc-ada/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/gcc-ada/
}

package_gcc-go()
{
  pkgdesc="Go front-end for GCC"
  depends=("gcc=$pkgver-$pkgrel")
  options=('staticlibs' '!emptydirs')
  install=gcc-go.install

  cd ${srcdir}/gcc-build
  make -C $CHOST/libgo DESTDIR=$pkgdir install-exec-am
  make -C gcc DESTDIR=$pkgdir go.install-{common,man,info}
  install -Dm755 gcc/go1 $pkgdir/${_libdir}/go1

  rm $pkgdir/usr/lib/libgo.a

  # Install Runtime Library Exception
  install -d ${pkgdir}/usr/share/licenses/gcc-go/
  ln -s ../gcc-libs/RUNTIME.LIBRARY.EXCEPTION ${pkgdir}/usr/share/licenses/gcc-go/
}
