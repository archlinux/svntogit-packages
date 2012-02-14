# $Id$
# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: valgrind requires rebuilt with each major glibc version

pkgname=glibc
pkgver=2.15
pkgrel=6
_glibcdate=20111227
pkgdesc="GNU C Library"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/libc"
license=('GPL' 'LGPL')
groups=('base')
depends=('linux-api-headers>=3.1.6' 'tzdata')
makedepends=('gcc>=4.6')
backup=(etc/gai.conf
        etc/locale.gen
        etc/nscd.conf)
options=('!strip')
install=glibc.install
source=(ftp://ftp.archlinux.org/other/glibc/${pkgname}-${pkgver}_${_glibcdate}.tar.xz
        glibc-2.10-dont-build-timezone.patch
        glibc-2.10-bz4781.patch
        glibc-__i686.patch
        glibc-2.12.2-ignore-origin-of-privileged-program.patch
        glibc-2.14-libdl-crash.patch
        glibc-2.14-revert-4768ae77.patch
        glibc-2.14-reexport-rpc-interface.patch
        glibc-2.14-reinstall-nis-rpc-headers.patch
        glibc-2.15-regex.patch
        glibc-2.15-lddebug-scopes.patch
        glibc-2.15-revert-c5a0802a.patch
        glibc-2.15-scanf.patch
        glibc-2.15-ifunc.patch
        glibc-2.15-avx.patch
        glibc-2.15-strcasecmp-disable-avx.patch
        glibc-2.15-gb18030.patch
        glibc-2.15-revert-netlink-cache.patch
        glibc-2.15-arena.patch
        glibc-2.15-negative-result-cache.patch
        nscd
        locale.gen.txt
        locale-gen)
md5sums=('6ffdf5832192b92f98bdd125317c0dfc'
         '4dadb9203b69a3210d53514bb46f41c3'
         '0c5540efc51c0b93996c51b57a8540ae'
         '40cd342e21f71f5e49e32622b25acc52'
         'b042647ea7d6f22ad319e12e796bd13e'
         '6970bcfeb3bf88913436d5112d16f588'
         '7da8c554a3b591c7401d7023b1928afc'
         'c5de2a946215d647c8af5432ec4b0da0'
         '55febbb72139ac7b65757df085024b83'
         'b3526cbd5e29773560dba725db99af5a'
         '3c219ddfb619b6df903cac4cc42c611d'
         '7ae3e426251ae33e73dbad71f9c91378'
         '39353f53168f4a7509ba5fe0d9f218b8'
         '136eb969f5d6bb6f5155f72a1a7cf23e'
         '41ae047ac88e8f6f547c70b0a0bc3b72'
         'fccb89f6628f59752278e125c35941f8'
         'c4cd34f20ccd37817f6c1374bd4ee68e'
         '6771b0b2bb8aa3870a259fd2f46c424f'
         'a9ffadcfd2d357f91fee0b861fd4a7c6'
         '2c46b8e294de24c531f2253ff69aeef3'
         'b587ee3a70c9b3713099295609afde49'
         '07ac979b6ab5eeb778d55f041529d623'
         '476e9113489f93b348b21e144b6a8fcf')


mksource() {
  git clone git://sourceware.org/git/glibc.git
  pushd glibc
  #git checkout -b glibc-2.15-arch origin/release/2.15/master
  git checkout -b glibc-2.15-arch origin/master
  popd
  tar -cvJf glibc-${pkgver}_${_glibcdate}.tar.xz glibc/*
}

build() {
  cd ${srcdir}/glibc

  # timezone data is in separate package (tzdata)
  patch -Np1 -i ${srcdir}/glibc-2.10-dont-build-timezone.patch

  # http://sources.redhat.com/bugzilla/show_bug.cgi?id=4781
  patch -Np1 -i ${srcdir}/glibc-2.10-bz4781.patch

  # Undefine __i686 for gcc <= 4.6
  # http://sourceware.org/ml/libc-alpha/2009-07/msg00072.html
  # fix in http://sourceware.org/git/?p=glibc.git;a=commit;h=d4a54ac6 requires additional backporting...
  patch -Np1 -i ${srcdir}/glibc-__i686.patch

  # http://www.exploit-db.com/exploits/15274/
  # http://sourceware.org/git/?p=glibc.git;a=patch;h=d14e6b09  (fedora branch)
  patch -Np1 -i ${srcdir}/glibc-2.12.2-ignore-origin-of-privileged-program.patch

  # http://sourceware.org/git/?p=glibc.git;a=commitdiff;h=675155e9  (fedora branch)
  # http://sourceware.org/ml/libc-alpha/2011-06/msg00006.html
  patch -Np1 -i ${srcdir}/glibc-2.14-libdl-crash.patch

  # Revert commit causing issues with crappy DNS servers...
  # Will be removed when workaround becomes annoying to maintain - USE A BETTER DNS SERVER!
  # Note that both these patches appear not to fix the issue completely (but rebuilds may fix):
  # http://sourceware.org/bugzilla/show_bug.cgi?id=13013  (used by opensuse)
  # http://sourceware.org/git/?p=glibc.git;a=commitdiff;h=032c0ee3  (fedora branch)
  patch -Np1 -i ${srcdir}/glibc-2.14-revert-4768ae77.patch

  # re-export RPC interface until libtirpc is ready as a replacement
  # http://sourceware.org/git/?p=glibc.git;a=commitdiff;h=acee4873  (fedora branch)
  patch -Np1 -i ${srcdir}/glibc-2.14-reexport-rpc-interface.patch
  # http://sourceware.org/git/?p=glibc.git;a=commitdiff;h=bdd816a3  (fedora branch)
  patch -Np1 -i ${srcdir}/glibc-2.14-reinstall-nis-rpc-headers.patch

  # Fix up regcomp/regexec
  # http://sourceware.org/git/?p=glibc.git;a=commit;h=2ba92745
  patch -Np1 -i ${srcdir}/glibc-2.15-regex.patch

  # propriety nvidia crash - https://bugzilla.redhat.com/show_bug.cgi?id=737223 
  # http://sourceware.org/git/?p=glibc.git;a=commitdiff;h=0c95ab64  (fedora branch)
  patch -Np1 -i ${srcdir}/glibc-2.15-lddebug-scopes.patch

  # revert commit c5a0802a - causes various hangs
  # https://bugzilla.redhat.com/show_bug.cgi?id=769421
  # Note: fedora may have actual fix (not submitted upstream yet...)
  # http://pkgs.fedoraproject.org/gitweb/?p=glibc.git;a=blob_plain;f=glibc-rh552960-2.patch
  patch -Np1 -i ${srcdir}/glibc-2.15-revert-c5a0802a.patch

  # fix realloc usage in vfscanf
  # http://sourceware.org/git/?p=glibc.git;a=commit;h=20b38e03
  patch -Np1 -i ${srcdir}/glibc-2.15-scanf.patch

  # fix ifunc relocations
  # http://sourceware.org/git/?p=glibc.git;a=commit;h=6ee65ed6
  patch -Np1 -i ${srcdir}/glibc-2.15-ifunc.patch
        
  # fix AVX detection
  # http://sourceware.org/git/?p=glibc.git;a=commit;h=afc5ed09
  # http://sourceware.org/git/?p=glibc.git;a=commit;h=08cf777f
  patch -Np1 -i ${srcdir}/glibc-2.15-avx.patch
  # and "fix" strcasecmp
  patch -Np1 -i ${srcdir}/glibc-2.15-strcasecmp-disable-avx.patch

  # fix GB18030 charmap
  # http://sourceware.org/bugzilla/show_bug.cgi?id=11837
  # http://sourceware.org/git/?p=glibc.git;a=commit;h=2a57bd79  (fedora branch)
  # http://sourceware.org/git/?p=glibc.git;a=commit;h=3d828a61  (fedora branch)
  patch -Np1 -i ${srcdir}/glibc-2.15-gb18030.patch

  # fix crash in __nscd_get_mapping if nscd not running
  # http://sourceware.org/bugzilla/show_bug.cgi?id=13594 (potential "fix" in comment)
  # reverts commit 3a2c0242 and other necessary following changes...
  patch -Np1 -i ${srcdir}/glibc-2.15-revert-netlink-cache.patch

  # handle ARENA_TEST correctly
  # http://sourceware.org/git/?p=glibc.git;a=commit;h=41b81892
  patch -Np1 -i ${srcdir}/glibc-2.15-arena.patch

  # Do not cache negative results in nscd if these are transient
  # http://sourceware.org/git/?p=glibc.git;a=commit;h=3e1aa84e
  patch -Np1 -i ${srcdir}/glibc-2.15-negative-result-cache.patch

  install -dm755 ${pkgdir}/etc
  touch ${pkgdir}/etc/ld.so.conf

  cd ${srcdir}
  mkdir glibc-build
  cd glibc-build

  if [[ ${CARCH} = "i686" ]]; then
    # Hack to fix NPTL issues with Xen, only required on 32bit platforms
    export CFLAGS="${CFLAGS} -mno-tls-direct-seg-refs"
  fi

  echo "slibdir=/lib" >> configparms

  # remove hardening options from CFLAGS for building libraries
  CFLAGS=${CFLAGS/-fstack-protector/}
  CFLAGS=${CFLAGS/-D_FORTIFY_SOURCE=2/}

  ${srcdir}/glibc/configure --prefix=/usr \
      --libdir=/usr/lib --libexecdir=/usr/lib \
      --with-headers=/usr/include \
      --enable-add-ons=nptl,libidn \
      --enable-kernel=2.6.32 \
      --with-tls --with-__thread \
      --enable-bind-now --without-gd \
      --without-cvs --disable-profile \
      --enable-multi-arch

  # build libraries with hardening disabled
  echo "build-programs=no" >> configparms
  make
  
  # re-enable hardening for programs
  sed -i "s#=no#=yes#" configparms
  echo "CC += -fstack-protector -D_FORTIFY_SOURCE=2" >> configparms
  echo "CXX += -fstack-protector -D_FORTIFY_SOURCE=2" >> configparms
  make

  # remove harding in preparation to run test-suite
  sed -i '2,4d' configparms
}

check() {
  cd ${srcdir}/glibc-build

  # some errors are expected - manually check log files
  make -k check || true
}

package() {
  cd ${srcdir}/glibc-build
  make install_root=${pkgdir} install

  rm -f ${pkgdir}/etc/ld.so.{cache,conf}

  install -dm755 ${pkgdir}/etc/rc.d
  install -dm755 ${pkgdir}/usr/sbin
  install -dm755 ${pkgdir}/usr/lib/locale
  install -m644 ${srcdir}/glibc/nscd/nscd.conf ${pkgdir}/etc/nscd.conf
  install -m755 ${srcdir}/nscd ${pkgdir}/etc/rc.d/nscd
  install -m755 ${srcdir}/locale-gen ${pkgdir}/usr/sbin
  install -m644 ${srcdir}/glibc/posix/gai.conf ${pkgdir}/etc/gai.conf

  sed -i -e 's/^\tserver-user/#\tserver-user/' ${pkgdir}/etc/nscd.conf

  # create /etc/locale.gen
  install -m644 ${srcdir}/locale.gen.txt ${pkgdir}/etc/locale.gen
  sed -i "s|/| |g" ${srcdir}/glibc/localedata/SUPPORTED
  sed -i 's|\\| |g' ${srcdir}/glibc/localedata/SUPPORTED
  sed -i "s|SUPPORTED-LOCALES=||" ${srcdir}/glibc/localedata/SUPPORTED
  cat ${srcdir}/glibc/localedata/SUPPORTED >> ${pkgdir}/etc/locale.gen
  sed -i "s|^|#|g" ${pkgdir}/etc/locale.gen

  if [[ ${CARCH} = "x86_64" ]]; then
    # fix for the linker
    sed -i '/RTLDLIST/s%lib64%lib%' ${pkgdir}/usr/bin/ldd
    # Comply with multilib binaries, they look for the linker in /lib64
    mkdir ${pkgdir}/lib64
    cd ${pkgdir}/lib64
    ln -v -s ../lib/ld* .
  fi
  
  # Do not strip the following files for improved debugging support
  # ("improved" as in not breaking gdb and valgrind...):
  #   ld-${pkgver}.so
  #   libc-${pkgver}.so
  #   libpthread-${pkgver}.so
  #   libthread_db-1.0.so

  cd $pkgdir
  strip $STRIP_BINARIES sbin/{ldconfig,sln} \
                        usr/bin/{gencat,getconf,getent,iconv,locale,localedef} \
                        usr/bin/{makedb,pcprofiledump,pldd,rpcgen,sprof} \
                        usr/lib/getconf/* \
                        usr/sbin/{iconvconfig,nscd}
  [[ $CARCH = "i686" ]] && strip $STRIP_BINARIES usr/bin/lddlibc4

  strip $STRIP_STATIC usr/lib/*.a

  strip $STRIP_SHARED lib/{libanl,libBrokenLocale,libcidn,libcrypt}-${pkgver}.so \
                      lib/libnss_{compat,db,dns,files,hesiod,nis,nisplus}-${pkgver}.so \
                      lib/{libdl,libm,libnsl,libresolv,librt,libutil}-${pkgver}.so \
                      lib/{libmemusage,libpcprofile,libSegFault}.so \
                      usr/lib/{pt_chown,{audit,gconv}/*.so}
}
