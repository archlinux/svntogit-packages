# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=glibc
pkgver=2.8
pkgrel=1
_glibcdate=20080610
install=glibc.install
backup=(etc/locale.gen)
pkgdesc="GNU C Library"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://www.gnu.org/software/libc"
groups=('base')
depends=('sh' 'kernel-headers>=2.6.25.6' 'tzdata')
makedepends=('gcc>=4.3.1-1')
replaces=('glibc-xen')
source=(ftp://ftp.archlinux.org/other/glibc/${pkgname}-2.8_${_glibcdate}.tar.bz2
	ftp://ftp.archlinux.org/other/glibc/glibc-patches-${pkgver}-1.tar.bz2
	nscd
	locale.gen.txt
	locale-gen)
md5sums=('63def58972f0e8429247916154c21323'
         'a816b94ff5e94f1ee1bbaa5c447e6f8d'
         'b587ee3a70c9b3713099295609afde49'
         '07ac979b6ab5eeb778d55f041529d623'
         '476e9113489f93b348b21e144b6a8fcf')

build() {

  # for cvs checkout
#  mkdir ${startdir}/src/glibc-${_glibcdate}
#  cd ${startdir}/src/glibc-${_glibcdate}
#  export _TAG=glibc-2_8-branch
#  export 'CVSROOT=:pserver:anoncvs@sources.redhat.com:/cvs/glibc'
#  cvs -z9 co -r $_TAG libc || return 1
#  tar -cvjf glibc-2.8_${_glibcdate}.tar.bz2 libc
#  return 1

  cd ${startdir}/src/libc

  # patch from Debian
  patch -Np1 -i ${startdir}/src/glibc-patches/glibc-2.5-localedef_segfault-1.patch || return 1 # still needed?

  # Gentoo fixes
  patch -Np1 -i ${startdir}/src/glibc-patches/glibc-dont-build-timezone.patch || return 1

  install -m755 -d ${startdir}/pkg/etc
  touch ${startdir}/pkg/etc/ld.so.conf

  mkdir glibc-build
  cd glibc-build

  if [ "${CARCH}" = "i686" ]; then
    # Hack to fix NPTL issues with Xen, only required on 32bit platforms
    export CFLAGS="${CFLAGS} -mno-tls-direct-seg-refs"
  fi

  echo "slibdir=/lib" >> configparms

  ../configure --prefix=/usr \
      --enable-add-ons=nptl,libidn --without-cvs \
      --enable-kernel=2.6.16 --disable-profile \
      --with-headers=/usr/include --libexecdir=/usr/lib \
      --enable-bind-now --with-tls --with-__thread \
      --libdir=/usr/lib --without-gd
    
  make || return 1
  make install_root=${startdir}/pkg install || return 1

  rm -f ${startdir}/pkg/etc/ld.so.cache ${startdir}/pkg/etc/ld.so.conf ${startdir}/pkg/etc/localtime

  install -m755 -d ${startdir}/pkg/etc/rc.d
  install -m755 -d ${startdir}/pkg/usr/sbin
  install -m755 -d ${startdir}/pkg/usr/lib/locale
  install -m644 ${startdir}/src/libc/nscd/nscd.conf ${startdir}/pkg/etc/nscd.conf
  install -m755 ${startdir}/src/nscd ${startdir}/pkg/etc/rc.d/nscd
  install -m755 ${startdir}/src/locale-gen ${startdir}/pkg/usr/sbin

  sed -i -e 's/^\tserver-user/#\tserver-user/' ${startdir}/pkg/etc/nscd.conf || return 1

  # create /etc/locale.gen
  install -m644 ${startdir}/src/locale.gen.txt ${startdir}/pkg/etc/locale.gen
  sed -i "s|/| |g" ${startdir}/src/libc/localedata/SUPPORTED
  sed -i 's|\\| |g' ${startdir}/src/libc/localedata/SUPPORTED
  sed -i "s|SUPPORTED-LOCALES=||" ${startdir}/src/libc/localedata/SUPPORTED
  cat ${startdir}/src/libc/localedata/SUPPORTED >> ${startdir}/pkg/etc/locale.gen
  sed -i "s|^|#|g" ${startdir}/pkg/etc/locale.gen

  if [ "${CARCH}" = "x86_64" ]; then
    # fix for the linker
    sed -i '/RTLDLIST/s%/ld-linux.so.2 /lib64%%' ${startdir}/pkg/usr/bin/ldd
    #Comply with multilib binaries, they look for the linker in /lib64
    mkdir ${startdir}/pkg/lib64
    cd ${startdir}/pkg/lib64
    ln -v -s ../lib/ld* .
  fi
}
