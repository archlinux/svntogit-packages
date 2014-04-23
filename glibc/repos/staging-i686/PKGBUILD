# $Id$
# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: valgrind requires rebuilt with each major glibc version

# NOTE: adjust version in install script when locale files are updated

pkgname=glibc
pkgver=2.19
pkgrel=4
pkgdesc="GNU C Library"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/libc"
license=('GPL' 'LGPL')
groups=('base')
depends=('linux-api-headers>=3.13' 'tzdata' 'filesystem>=2013.01')
makedepends=('gcc>=4.8')
backup=(etc/gai.conf
        etc/locale.gen
        etc/nscd.conf)
options=('!strip' 'staticlibs')
install=glibc.install
source=(http://ftp.gnu.org/gnu/libc/${pkgname}-${pkgver}.tar.xz{,.sig}
        glibc-2.19-xattr_header.patch
        glibc-2.19-fix-sign-in-bsloww1-input.patch
        locale.gen.txt
        locale-gen)
md5sums=('e26b8cc666b162f999404b03970f14e4'
         'SKIP'
         '39a4876837789e07746f1d84cd8cb46a'
         '755a1a9d7844a5e338eddaa9a5d974cd'
         '07ac979b6ab5eeb778d55f041529d623'
         '476e9113489f93b348b21e144b6a8fcf')

prepare() {
  cd ${srcdir}/${pkgname}-${pkgver}
  
  # fix for {linux,sys}/xattr.h incompatibility - commit fdbe8eae
  patch -p1 -i $srcdir/glibc-2.19-xattr_header.patch

  # fix issues in sin/cos slow path calculation - commit ffe768a9
  patch -p1 -i $srcdir/glibc-2.19-fix-sign-in-bsloww1-input.patch

  mkdir ${srcdir}/glibc-build
}

build() {
  cd ${srcdir}/glibc-build

  if [[ ${CARCH} = "i686" ]]; then
    # Hack to fix NPTL issues with Xen, only required on 32bit platforms
    # TODO: make separate glibc-xen package for i686
    export CFLAGS="${CFLAGS} -mno-tls-direct-seg-refs"
  fi

  echo "slibdir=/usr/lib" >> configparms
  echo "sbindir=/usr/bin" >> configparms
  echo "rootsbindir=/usr/bin" >> configparms

  # remove hardening options for building libraries
  CFLAGS=${CFLAGS/-fstack-protector/}
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}

  ${srcdir}/${pkgname}-${pkgver}/configure --prefix=/usr \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --with-headers=/usr/include \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-add-ons=nptl,libidn \
      --enable-obsolete-rpc \
      --enable-kernel=2.6.32 \
      --enable-bind-now --disable-profile \
      --enable-stackguard-randomization \
      --enable-lock-elision \
      --enable-multi-arch

  # build libraries with hardening disabled
  echo "build-programs=no" >> configparms
  make
  
  # re-enable hardening for programs
  sed -i "/build-programs=/s#no#yes#" configparms
  echo "CC += -fstack-protector -D_FORTIFY_SOURCE=2" >> configparms
  echo "CXX += -fstack-protector -D_FORTIFY_SOURCE=2" >> configparms
  make

  # remove harding in preparation to run test-suite
  sed -i '4,6d' configparms
}

check() {
  # the linker commands need to be reordered - fixed in 2.19
  LDFLAGS=${LDFLAGS/--as-needed,/}

  cd ${srcdir}/glibc-build

  # only acceptable testsuite error is some small libm ulp failures on i686 with gcc-4.9
  # TODO: fix upstream and provide patch
  make -k check || true
}

package() {
  cd ${srcdir}/glibc-build

  install -dm755 ${pkgdir}/etc
  touch ${pkgdir}/etc/ld.so.conf

  make install_root=${pkgdir} install

  rm -f ${pkgdir}/etc/ld.so.{cache,conf}

  install -dm755 ${pkgdir}/usr/lib/{locale,systemd/system,tmpfiles.d}

  install -m644 ${srcdir}/${pkgname}-${pkgver}/nscd/nscd.conf ${pkgdir}/etc/nscd.conf
  install -m644 ${srcdir}/${pkgname}-${pkgver}/nscd/nscd.service ${pkgdir}/usr/lib/systemd/system
  install -m644 ${srcdir}/${pkgname}-${pkgver}/nscd/nscd.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/nscd.conf

  install -m644 ${srcdir}/${pkgname}-${pkgver}/posix/gai.conf ${pkgdir}/etc/gai.conf

  install -m755 ${srcdir}/locale-gen ${pkgdir}/usr/bin

  # create /etc/locale.gen
  install -m644 ${srcdir}/locale.gen.txt ${pkgdir}/etc/locale.gen
  sed -e '1,3d' -e 's|/| |g' -e 's|\\| |g' -e 's|^|#|g' \
    ${srcdir}/glibc-${pkgver}/localedata/SUPPORTED >> ${pkgdir}/etc/locale.gen

  # remove the static libraries that have a shared counterpart
  # libc, libdl, libm and libpthread are required for toolchain testsuites
  # in addition libcrypt appears widely required
  rm $pkgdir/usr/lib/lib{anl,BrokenLocale,nsl,resolv,rt,util}.a

  # Do not strip the following files for improved debugging support
  # ("improved" as in not breaking gdb and valgrind...):
  #   ld-${pkgver}.so
  #   libc-${pkgver}.so
  #   libpthread-${pkgver}.so
  #   libthread_db-1.0.so

  cd $pkgdir
  strip $STRIP_BINARIES usr/bin/{gencat,getconf,getent,iconv,iconvconfig} \
                        usr/bin/{ldconfig,locale,localedef,nscd,makedb} \
                        usr/bin/{pcprofiledump,pldd,rpcgen,sln,sprof} \
                        usr/lib/getconf/*
  [[ $CARCH = "i686" ]] && strip $STRIP_BINARIES usr/bin/lddlibc4

  strip $STRIP_STATIC usr/lib/*.a

  strip $STRIP_SHARED usr/lib/{libanl,libBrokenLocale,libcidn,libcrypt}-*.so \
                      usr/lib/libnss_{compat,db,dns,files,hesiod,nis,nisplus}-*.so \
                      usr/lib/{libdl,libm,libnsl,libresolv,librt,libutil}-*.so \
                      usr/lib/{libmemusage,libpcprofile,libSegFault}.so \
                      usr/lib/{audit,gconv}/*.so
}
