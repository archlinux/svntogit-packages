# $Id$
# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: valgrind requires rebuilt with each major glibc version

pkgname=glibc
pkgver=2.17
pkgrel=6
pkgdesc="GNU C Library"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/libc"
license=('GPL' 'LGPL')
groups=('base')
depends=('linux-api-headers>=3.7' 'tzdata' 'filesystem>=2013.01')
makedepends=('gcc>=4.7')
backup=(etc/gai.conf
        etc/locale.gen
        etc/nscd.conf)
options=('!strip')
install=glibc.install
source=(http://ftp.gnu.org/gnu/libc/${pkgname}-${pkgver}.tar.xz{,.sig}
        glibc-2.17-sync-with-linux37.patch
        glibc-2.17-getaddrinfo-stack-overflow.patch
        glibc-2.17-regexp-matcher-overrun.patch
        nscd.service
        nscd.tmpfiles
        locale.gen.txt
        locale-gen)
md5sums=('87bf675c8ee523ebda4803e8e1cec638'
         'SKIP'
         'fb99380d94598cc76d793deebf630022'
         '56d5f2c09503a348281a20ae404b7de3'
         '200acc05961b084ee00dde919e64f82d'
         'c1e07c0bec0fe89791bfd9d13fc85edf'
         'bccbe5619e75cf1d97312ec3681c605c'
         '07ac979b6ab5eeb778d55f041529d623'
         '476e9113489f93b348b21e144b6a8fcf')


build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  # combination of upstream commits 318cd0b, b540704 and fc1abbe
  patch -p1 -i ${srcdir}/glibc-2.17-sync-with-linux37.patch

  # CVE-2013-1914 - upstream commit 1cef1b19
  patch -p1 -i ${srcdir}/glibc-2.17-getaddrinfo-stack-overflow.patch

  # CVE-2013-0242 - upstream commit a445af0b
  patch -p1 -i ${srcdir}/glibc-2.17-regexp-matcher-overrun.patch

  cd ${srcdir}
  mkdir glibc-build
  cd glibc-build

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
  # bug to file - the linker commands need to be reordered
  LDFLAGS=${LDFLAGS/--as-needed,/}

  cd ${srcdir}/glibc-build
  make check
}

package() {
  cd ${srcdir}/glibc-build

  install -dm755 ${pkgdir}/etc
  touch ${pkgdir}/etc/ld.so.conf

  make install_root=${pkgdir} install

  rm -f ${pkgdir}/etc/ld.so.{cache,conf}

  install -dm755 ${pkgdir}/usr/lib/{locale,systemd/system,tmpfiles.d}

  install -m644 ${srcdir}/${pkgname}-${pkgver}/nscd/nscd.conf ${pkgdir}/etc/nscd.conf
  install -m644 ${srcdir}/nscd.service ${pkgdir}/usr/lib/systemd/system
  install -m644 ${srcdir}/nscd.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/nscd.conf

  install -m644 ${srcdir}/${pkgname}-${pkgver}/posix/gai.conf ${pkgdir}/etc/gai.conf

  install -m755 ${srcdir}/locale-gen ${pkgdir}/usr/bin

  # create /etc/locale.gen
  install -m644 ${srcdir}/locale.gen.txt ${pkgdir}/etc/locale.gen
  sed -e '1,3d' -e 's|/| |g' -e 's|\\| |g' -e 's|^|#|g' \
    ${srcdir}/glibc-${pkgver}/localedata/SUPPORTED >> ${pkgdir}/etc/locale.gen

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
                      usr/lib/{pt_chown,{audit,gconv}/*.so}
}
