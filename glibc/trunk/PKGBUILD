# $Id$
# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: valgrind requires rebuilt with each major glibc version

pkgname=glibc
pkgver=2.23
pkgrel=4
_commit=a37d61a6
pkgdesc="GNU C Library"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/libc"
license=('GPL' 'LGPL')
groups=('base')
depends=('linux-api-headers>=4.1' 'tzdata' 'filesystem')
makedepends=('gcc>=5.2' 'git')
backup=(etc/gai.conf
        etc/locale.gen
        etc/nscd.conf)
options=('!strip' 'staticlibs')
install=glibc.install
source=(git://sourceware.org/git/glibc.git#commit=${_commit}
        locale.gen.txt
        locale-gen)
md5sums=('SKIP'
         '07ac979b6ab5eeb778d55f041529d623'
         '476e9113489f93b348b21e144b6a8fcf')

prepare() {
  mkdir glibc-build
}

build() {
  cd glibc-build

  if [[ ${CARCH} = "i686" ]]; then
    # Hack to fix NPTL issues with Xen, only required on 32bit platforms
    # TODO: make separate glibc-xen package for i686
    export CFLAGS="${CFLAGS} -mno-tls-direct-seg-refs"
  fi

  echo "slibdir=/usr/lib" >> configparms
  echo "rtlddir=/usr/lib" >> configparms
  echo "sbindir=/usr/bin" >> configparms
  echo "rootsbindir=/usr/bin" >> configparms

  # remove hardening options for building libraries
  CFLAGS=${CFLAGS/-fstack-protector-strong/}
  CPPFLAGS=${CPPFLAGS/-D_FORTIFY_SOURCE=2/}

  ../${pkgname}/configure --prefix=/usr \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --with-headers=/usr/include \
      --with-bugurl=https://bugs.archlinux.org/ \
      --enable-add-ons \
      --enable-obsolete-rpc \
      --enable-kernel=2.6.32 \
      --enable-bind-now --disable-profile \
      --enable-stackguard-randomization \
      --enable-lock-elision \
      --enable-multi-arch \
      --disable-werror

  # build libraries with hardening disabled
  echo "build-programs=no" >> configparms
  make

  # re-enable hardening for programs
  sed -i "/build-programs=/s#no#yes#" configparms
  echo "CC += -fstack-protector-strong -D_FORTIFY_SOURCE=2" >> configparms
  echo "CXX += -fstack-protector-strong -D_FORTIFY_SOURCE=2" >> configparms
  make

  # remove harding in preparation to run test-suite
  sed -i '/FORTIFY/d' configparms
}

check() {
  cd glibc-build

  # some failures are "expected"
  make check || true
}

package() {
  cd glibc-build

  install -dm755 ${pkgdir}/etc
  touch ${pkgdir}/etc/ld.so.conf

  make install_root=${pkgdir} install

  rm -f ${pkgdir}/etc/ld.so.{cache,conf}

  install -dm755 ${pkgdir}/usr/lib/{locale,systemd/system,tmpfiles.d}

  install -m644 ${srcdir}/${pkgname}/nscd/nscd.conf ${pkgdir}/etc/nscd.conf
  install -m644 ${srcdir}/${pkgname}/nscd/nscd.service ${pkgdir}/usr/lib/systemd/system
  install -m644 ${srcdir}/${pkgname}/nscd/nscd.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/nscd.conf

  install -m644 ${srcdir}/${pkgname}/posix/gai.conf ${pkgdir}/etc/gai.conf

  install -m755 ${srcdir}/locale-gen ${pkgdir}/usr/bin

  # create /etc/locale.gen
  install -m644 ${srcdir}/locale.gen.txt ${pkgdir}/etc/locale.gen
  sed -e '1,3d' -e 's|/| |g' -e 's|\\| |g' -e 's|^|#|g' \
    ${srcdir}/glibc/localedata/SUPPORTED >> ${pkgdir}/etc/locale.gen

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
  if [[ $CARCH = "i686" ]]; then
    strip $STRIP_BINARIES usr/bin/lddlibc4
  fi

  strip $STRIP_STATIC usr/lib/*.a

  strip $STRIP_SHARED usr/lib/lib{anl,BrokenLocale,cidn,crypt}-*.so \
                      usr/lib/libnss_{compat,db,dns,files,hesiod,nis,nisplus}-*.so \
                      usr/lib/lib{dl,m,nsl,resolv,rt,util}-*.so \
                      usr/lib/lib{memusage,pcprofile,SegFault}.so \
                      usr/lib/{audit,gconv}/*.so || true
  if [[ $CARCH = "x86_64" ]]; then
    strip $STRIP_SHARED usr/lib/libmvec-*.so
  fi
}
