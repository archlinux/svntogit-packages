# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc
# NOTE: valgrind requires rebuilt with each new glibc version

pkgname=glibc
pkgver=2.12
pkgrel=4
_glibcdate=20100620
pkgdesc="GNU C Library"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/libc"
license=('GPL' 'LGPL')
groups=('base')
depends=('linux-api-headers>=2.6.34' 'tzdata')
makedepends=('gcc>=4.4')
replaces=('glibc-xen')
backup=(etc/locale.gen
        etc/nscd.conf)
options=('!strip')
install=glibc.install
source=(ftp://ftp.archlinux.org/other/glibc/${pkgname}-${pkgver}_${_glibcdate}.tar.bz2
        glibc-2.10-dont-build-timezone.patch
        glibc-2.10-bz4781.patch
        glibc-__i686.patch
        nscd
        locale.gen.txt
        locale-gen)    
md5sums=('8857bfae3e0a659452ddd8f9d2606490'
         '4dadb9203b69a3210d53514bb46f41c3'
         '0c5540efc51c0b93996c51b57a8540ae'
         '40cd342e21f71f5e49e32622b25acc52'
         'b587ee3a70c9b3713099295609afde49'
         '07ac979b6ab5eeb778d55f041529d623'
         '476e9113489f93b348b21e144b6a8fcf')

mksource() {
  git clone git://sourceware.org/git/glibc.git
  pushd glibc
  git checkout -b glibc-2.12-arch origin/release/2.12/master
  popd
  tar -cvjf glibc-${pkgver}_${_glibcdate}.tar.bz2 glibc/*
}

build() {
  cd ${srcdir}/glibc

  # timezone data is in separate package (tzdata)
  patch -Np1 -i ${srcdir}/glibc-2.10-dont-build-timezone.patch

  # http://sources.redhat.com/bugzilla/show_bug.cgi?id=4781
  patch -Np1 -i ${srcdir}/glibc-2.10-bz4781.patch

  # http://sources.redhat.com/bugzilla/show_bug.cgi?id=411
  # http://sourceware.org/ml/libc-alpha/2009-07/msg00072.html
  patch -Np1 -i ${srcdir}/glibc-__i686.patch

  install -dm755 ${pkgdir}/etc
  touch ${pkgdir}/etc/ld.so.conf

  mkdir glibc-build
  cd glibc-build

  if [[ ${CARCH} = "i686" ]]; then
    # Hack to fix NPTL issues with Xen, only required on 32bit platforms
    export CFLAGS="${CFLAGS} -mno-tls-direct-seg-refs"
  fi

  echo "slibdir=/lib" >> configparms

  ../configure --prefix=/usr \
      --enable-add-ons=nptl,libidn --without-cvs \
      --enable-kernel=2.6.18 --disable-profile \
      --with-headers=/usr/include --libexecdir=/usr/lib \
      --enable-bind-now --with-tls --with-__thread \
      --libdir=/usr/lib --without-gd --disable-multi-arch
        
  make
}

package() {
  cd ${srcdir}/glibc/glibc-build
  make install_root=${pkgdir} install

  # provided by kernel-headers
  rm ${pkgdir}/usr/include/scsi/scsi.h

  rm ${pkgdir}/etc/ld.so.conf

  install -dm755 ${pkgdir}/etc/rc.d
  install -dm755 ${pkgdir}/usr/sbin
  install -dm755 ${pkgdir}/usr/lib/locale
  install -m644 ${srcdir}/glibc/nscd/nscd.conf ${pkgdir}/etc/nscd.conf
  install -m755 ${srcdir}/nscd ${pkgdir}/etc/rc.d/nscd
  install -m755 ${srcdir}/locale-gen ${pkgdir}/usr/sbin

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
    sed -i '/RTLDLIST/s%/ld-linux.so.2 /lib64%%' ${pkgdir}/usr/bin/ldd
    #Comply with multilib binaries, they look for the linker in /lib64
    mkdir ${pkgdir}/lib64
    cd ${pkgdir}/lib64
    ln -v -s ../lib/ld* .
  fi
  
  # manually strip files as stripping libpthread-*.so and libthread_db.so
  # with the default $STRIP_SHARED breaks gdb and stripping ld-*.so breaks
  # valgrind on x86_64

  cd $pkgdir
  strip $STRIP_BINARIES sbin/{ldconfig,sln} \
                        usr/bin/{gencat,getconf,getent,iconv,locale} \
                        usr/bin/{localedef,pcprofiledump,rpcgen,sprof} \
                        usr/lib/getconf/* \
                        usr/sbin/{iconvconfig,nscd,rpcinfo}
  [[ $CARCH = "i686" ]] && strip $STRIP_BINARIES usr/bin/lddlibc4

  strip $STRIP_STATIC usr/lib/*.a \
                      lib/{{ld,libpthread}-2.12,libthread_db-1.0}.so

  strip $STRIP_SHARED lib/{libanl,libBrokenLocale,libc,libcidn,libcrypt}-2.12.so \
                      lib/libnss_{compat,dns,files,hesiod,nis,nisplus}-2.12.so \
                      lib/{libdl,libm,libnsl,libresolv,librt,libutil}-2.12.so \
                      lib/{libmemusage,libpcprofile,libSegFault}.so \
                      usr/lib/{pt_chown,gconv/*.so}
}
