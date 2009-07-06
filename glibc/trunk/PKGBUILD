# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Allan McRae <allan@archlinux.org>

# toolchain build order: kernel-headers->glibc->binutils->gcc-libs->gcc->binutils->glibc

pkgname=glibc
pkgver=2.10.1
pkgrel=3
_glibcdate=20090511
install=glibc.install
backup=(etc/locale.gen
	etc/nscd.conf)
pkgdesc="GNU C Library"
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://www.gnu.org/software/libc"
groups=('base')
depends=('kernel-headers>=2.6.30.1' 'tzdata')
makedepends=('gcc>=4.4')
replaces=('glibc-xen')
source=(ftp://ftp.archlinux.org/other/glibc/${pkgname}-${pkgver}_${_glibcdate}.tar.bz2
	glibc-2.10-dont-build-timezone.patch
	glibc-2.10-bz4781.patch
	nscd
	locale.gen.txt
	locale-gen)
md5sums=('7a34595abeeedb9aab758aa51d09ed88'
         '4dadb9203b69a3210d53514bb46f41c3'
         '0c5540efc51c0b93996c51b57a8540ae'
         'b587ee3a70c9b3713099295609afde49'
         '07ac979b6ab5eeb778d55f041529d623'
         '476e9113489f93b348b21e144b6a8fcf')

build() {

  # for git checkout
  #mkdir ${srcdir}/glibc-${pkgver}_${_glibcdate}
  #cd ${srcdir}/glibc-${pkgver}_${_glibcdate}
  #git clone git://sourceware.org/git/glibc.git
  #pushd glibc
  #git checkout --track -b glibc-${pkgver} origin/cvs/glibc-2_10-branch
  #popd
  #tar -cvjf ${startdir}/glibc-${pkgver}_${_glibcdate}.tar.bz2 glibc/*
  #return 1

  cd ${srcdir}/glibc

  # timezone data is in separate package (tzdata)
  patch -Np1 -i ${srcdir}/glibc-2.10-dont-build-timezone.patch || return 1

  # http://sources.redhat.com/bugzilla/show_bug.cgi?id=4781
  patch -Np1 -i ${srcdir}/glibc-2.10-bz4781.patch || return 1

  install -dm755 ${pkgdir}/etc
  touch ${pkgdir}/etc/ld.so.conf

  mkdir glibc-build
  cd glibc-build

  if [ "${CARCH}" = "i686" ]; then
    # Hack to fix NPTL issues with Xen, only required on 32bit platforms
    export CFLAGS="${CFLAGS} -mno-tls-direct-seg-refs"
  fi

  echo "slibdir=/lib" >> configparms

  ../configure --prefix=/usr \
      --enable-add-ons=nptl,libidn --without-cvs \
      --enable-kernel=2.6.18 --disable-profile \
      --with-headers=/usr/include --libexecdir=/usr/lib \
      --enable-bind-now --with-tls --with-__thread \
      --libdir=/usr/lib --without-gd
        
  make || return 1
  make install_root=${pkgdir} install || return 1

  rm -f ${pkgdir}/etc/ld.so.cache ${pkgdir}/etc/ld.so.conf ${pkgdir}/etc/localtime

  install -dm755 ${pkgdir}/etc/rc.d
  install -dm755 ${pkgdir}/usr/sbin
  install -dm755 ${pkgdir}/usr/lib/locale
  install -m644 ${srcdir}/glibc/nscd/nscd.conf ${pkgdir}/etc/nscd.conf
  install -m755 ${srcdir}/nscd ${pkgdir}/etc/rc.d/nscd
  install -m755 ${srcdir}/locale-gen ${pkgdir}/usr/sbin

  sed -i -e 's/^\tserver-user/#\tserver-user/' ${pkgdir}/etc/nscd.conf || return 1

  # create /etc/locale.gen
  install -m644 ${srcdir}/locale.gen.txt ${pkgdir}/etc/locale.gen
  sed -i "s|/| |g" ${srcdir}/glibc/localedata/SUPPORTED
  sed -i 's|\\| |g' ${srcdir}/glibc/localedata/SUPPORTED
  sed -i "s|SUPPORTED-LOCALES=||" ${srcdir}/glibc/localedata/SUPPORTED
  cat ${srcdir}/glibc/localedata/SUPPORTED >> ${pkgdir}/etc/locale.gen
  sed -i "s|^|#|g" ${pkgdir}/etc/locale.gen

  if [ "${CARCH}" = "x86_64" ]; then
    # fix for the linker
    sed -i '/RTLDLIST/s%/ld-linux.so.2 /lib64%%' ${pkgdir}/usr/bin/ldd
    #Comply with multilib binaries, they look for the linker in /lib64
    mkdir ${pkgdir}/lib64
    cd ${pkgdir}/lib64
    ln -v -s ../lib/ld* .
  fi

  rm -f ${pkgdir}/usr/share/info/dir
  gzip -9 ${pkgdir}/usr/share/info/*
}
