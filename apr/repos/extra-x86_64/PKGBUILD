# $Id$
# Maintainer: Pierre Schmitz <pierre@archlinux.de>
pkgname=apr
pkgver=1.2.12
pkgrel=1
pkgdesc="The Apache Portable Runtime"
arch=('i686' 'x86_64')
url="http://apr.apache.org/"
depends=('e2fsprogs')
options=('!libtool')
license=('APACHE')
source=("http://www.apache.org/dist/apr/apr-${pkgver}.tar.bz2" \
	'fix-apr.pc.patch' \
	'fix_apr-config.patch' \
	'ship_find_apr.m4.patch')
md5sums=('c5da94517e3918f0f2b2e0a05f56aa21'
         'cc4e960c14a55aba304a247c4cfd63d9'
         'b57edc9ef228f1a90d1aa85d73e53695'
         'd85eb89f076e19a137afc4dd957874ab')
                           
build() {
  cd ${startdir}/src/apr-${pkgver}
  patch -Np1 -i ${startdir}/src/fix-apr.pc.patch || return 1
  patch -Np1 -i ${startdir}/src/fix_apr-config.patch || return 1
  patch -Np1 -i ${startdir}/src/ship_find_apr.m4.patch || return 1
  ./buildconf
  export ac_cv_search_shm_open=no

  ./configure --prefix=/usr --includedir=/usr/include/apr-1 \
  	--with-installbuilddir=/usr/share/apr-1/build \
	--enable-nonportable-atomics
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
