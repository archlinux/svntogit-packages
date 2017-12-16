# $Id$
# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: valgrind requires rebuilt with each major glibc version

pkgbase=glibc
pkgname=(glibc lib32-glibc)
pkgver=2.26
pkgrel=8
arch=(x86_64)
url='http://www.gnu.org/software/libc'
license=(GPL LGPL)
makedepends=(git gd)
options=(!strip staticlibs debug)
_commit=71170eba2af41e08d51cf9d7b1ded5fd4b0b5c9c  # release/2.26/master
source=(git+https://sourceware.org/git/glibc.git#commit=${_commit}
        locale.gen.txt
        locale-gen
        lib32-glibc.conf)
md5sums=('SKIP'
         '07ac979b6ab5eeb778d55f041529d623'
         '476e9113489f93b348b21e144b6a8fcf'
         '6e052f1cb693d5d3203f50f9d4e8c33b')

prepare() {
  mkdir -p glibc-build lib32-glibc-build
}

build() {
  local _configure_flags=(
      --prefix=/usr
      --with-headers=/usr/include
      --with-bugurl=https://bugs.archlinux.org/
      --enable-add-ons
      --enable-bind-now
      --enable-lock-elision
      --enable-multi-arch
      --enable-obsolete-nsl
      --enable-obsolete-rpc
      --enable-stack-protector=strong
      --enable-stackguard-randomization
      --disable-profile
      --disable-werror
  )

  cd "$srcdir/glibc-build"

  echo "slibdir=/usr/lib" >> configparms
  echo "rtlddir=/usr/lib" >> configparms
  echo "sbindir=/usr/bin" >> configparms
  echo "rootsbindir=/usr/bin" >> configparms

  # remove fortify for building libraries
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}

  "$srcdir/glibc/configure" \
      --libdir=/usr/lib \
      --libexecdir=/usr/lib \
      ${_configure_flags[@]}

  # build libraries with fortify disabled
  echo "build-programs=no" >> configparms
  make

  # re-enable fortify for programs
  sed -i "/build-programs=/s#no#yes#" configparms

  echo "CC += -D_FORTIFY_SOURCE=2" >> configparms
  echo "CXX += -D_FORTIFY_SOURCE=2" >> configparms
  make

  cd "$srcdir/lib32-glibc-build"
  export CC="gcc -m32 -mstackrealign"
  export CXX="g++ -m32 -mstackrealign"

  echo "slibdir=/usr/lib32" >> configparms
  echo "rtlddir=/usr/lib32" >> configparms
  echo "sbindir=/usr/bin" >> configparms
  echo "rootsbindir=/usr/bin" >> configparms

  # remove fortify for building libraries
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}
  CFLAGS=${CFLAGS/-fno-plt/}
  CXXFLAGS=${CXXFLAGS/-fno-plt/}

  "$srcdir/glibc/configure" \
      --host=i686-pc-linux-gnu \
      --libdir=/usr/lib32 \
      --libexecdir=/usr/lib32 \
      ${_configure_flags[@]}

  # build libraries with fortify disabled
  echo "build-programs=no" >> configparms
  make

  # re-enable fortify for programs
  sed -i "/build-programs=/s#no#yes#" configparms

  echo "CC += -D_FORTIFY_SOURCE=2" >> configparms
  echo "CXX += -D_FORTIFY_SOURCE=2" >> configparms
  make

}

check() {
  cd glibc-build

  # remove fortify in preparation to run test-suite
  sed -i '/FORTIFY/d' configparms

  # some failures are "expected"
  make check || true
}

package_glibc() {
  pkgdesc='GNU C Library'
  depends=('linux-api-headers>=4.10' tzdata filesystem)
  optdepends=('gd: for memusagestat')
  install=glibc.install
  backup=(etc/gai.conf
          etc/locale.gen
          etc/nscd.conf)
  groups=(base)

  install -dm755 "$pkgdir/etc"
  touch "$pkgdir/etc/ld.so.conf"

  make -C glibc-build install_root="$pkgdir" install
  rm -f "$pkgdir"/etc/ld.so.{cache,conf}

  cd glibc

  install -dm755 "$pkgdir"/usr/lib/{locale,systemd/system,tmpfiles.d}
  install -m644 nscd/nscd.conf "$pkgdir/etc/nscd.conf"
  install -m644 nscd/nscd.service "$pkgdir/usr/lib/systemd/system"
  install -m644 nscd/nscd.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/nscd.conf"
  install -dm755 "$pkgdir/var/db/nscd"

  install -m644 posix/gai.conf "$pkgdir"/etc/gai.conf

  install -m755 "$srcdir/locale-gen" "$pkgdir/usr/bin"

  # create /etc/locale.gen
  install -m644 "$srcdir/locale.gen.txt" "$pkgdir/etc/locale.gen"
  sed -e '1,3d' -e 's|/| |g' -e 's|\\| |g' -e 's|^|#|g' \
    "$srcdir/glibc/localedata/SUPPORTED" >> "$pkgdir/etc/locale.gen"

  # Do not strip the following files for improved debugging support
  # ("improved" as in not breaking gdb and valgrind...):
  #   ld-${pkgver}.so
  #   libc-${pkgver}.so
  #   libpthread-${pkgver}.so
  #   libthread_db-1.0.so

  if check_option 'debug' n; then
    cd "$pkgdir"
    strip $STRIP_BINARIES usr/bin/{gencat,getconf,getent,iconv,iconvconfig} \
                          usr/bin/{ldconfig,locale,localedef,nscd,makedb} \
                          usr/bin/{pcprofiledump,pldd,rpcgen,sln,sprof} \
                          usr/lib/getconf/*

    strip $STRIP_STATIC usr/lib/lib{anl,BrokenLocale,c{,_nonshared},crypt}.a \
                        usr/lib/lib{dl,g,ieee,mcheck,nsl,pthread{,_nonshared}}.a \
                        usr/lib/lib{resolv,rpcsvc,rt,util}.a \
                        usr/lib/lib{m-${pkgver},mvec{,_nonshared}}.a

    strip $STRIP_SHARED usr/lib/lib{anl,BrokenLocale,cidn,crypt}-${pkgver}.so \
                        usr/lib/libnss_{compat,db,dns,files,hesiod,nis,nisplus}-*.so \
                        usr/lib/lib{dl,m,nsl,resolv,rt,util}-${pkgver}.so \
                        usr/lib/lib{memusage,pcprofile,SegFault}.so \
                        usr/lib/{audit,gconv}/*.so usr/lib/libmvec-*.so || true
  fi
}

package_lib32-glibc() {
  pkgdesc='GNU C Library (32-bit)'
  depends=("glibc=$pkgver")

  cd lib32-glibc-build

  make install_root="$pkgdir" install
  rm -rf "$pkgdir"/{etc,sbin,usr/{bin,sbin,share},var}

  # We need to keep 32 bit specific header files
  find "$pkgdir/usr/include" -type f -not -name '*-32.h' -delete

  # Dynamic linker
  install -d "$pkgdir/usr/lib"
  ln -s ../lib32/ld-linux.so.2 "$pkgdir/usr/lib/"

  # Add lib32 paths to the default library search path
  install -Dm644 "$srcdir/lib32-glibc.conf" "$pkgdir/etc/ld.so.conf.d/lib32-glibc.conf"

  # Symlink /usr/lib32/locale to /usr/lib/locale
  ln -s ../lib/locale "$pkgdir/usr/lib32/locale"

  if check_option 'debug' n; then
    cd $pkgdir
    strip $STRIP_BINARIES usr/lib32/getconf/*
    strip $STRIP_STATIC usr/lib32/lib{anl,BrokenLocale,c{,_nonshared},crypt}.a \
                        usr/lib32/lib{dl,g,ieee,mcheck,nsl,pthread{,_nonshared}}.a \
                        usr/lib32/lib{resolv,rpcsvc,rt,util,m}.a
    strip $STRIP_SHARED usr/lib32/lib{anl,BrokenLocale,cidn,crypt}-${pkgver}.so \
                        usr/lib32/libnss_{compat,db,dns,files,hesiod,nis,nisplus}-*.so \
                        usr/lib32/lib{dl,m,nsl,resolv,rt,util}-${pkgver}.so \
                        usr/lib32/lib{memusage,pcprofile,SegFault}.so \
                        usr/lib32/{audit,gconv}/*.so || true
  fi
}
