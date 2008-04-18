# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
pkgname=db4.5
pkgver=4.5.20
pkgrel=1
pkgdesc="The Berkeley DB embedded database system 4.5"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.oracle.com/technology/software/products/berkeley-db/index.html"
depends=('gcc-libs')
options=('!libtool' '!makeflags')
source=(http://download-uk.oracle.com/berkeley-db/db-${pkgver}.tar.gz
	http://www.oracle.com/technology/products/berkeley-db/db/update/4.5.20/patch.4.5.20.1
	http://www.oracle.com/technology/products/berkeley-db/db/update/4.5.20/patch.4.5.20.2)
md5sums=('b0f1c777708cb8e9d37fb47e7ed3312d'
         'a571e239b9041d7990df287cbc59ad6f'
         'b7a7086a067ba116f5a8464362c9a9a7')

build() {
  cd ${startdir}/src/db-${pkgver}/
  patch -Np0 -i ${startdir}/src/patch.4.5.20.1 || return 1
  patch -Np0 -i ${startdir}/src/patch.4.5.20.2 || return 1

  cd build_unix
  ../dist/configure --prefix=/usr --enable-compat185 \
    --enable-shared --disable-static --enable-cxx
  make LIBSO_LIBS=-lpthread || return 1
  make prefix=${startdir}/pkg/usr \
       includedir=${startdir}/pkg/usr/include/db4.5 install

  rm -rf ${startdir}/pkg/usr/docs
  rm -f ${startdir}/pkg/usr/lib/libdb{,_cxx}.so
  rm -f ${startdir}/pkg/usr/lib/libdb{,_cxx}-4.so

  cd ${startdir}/pkg/usr/bin
  for i in *; do
    mv $i db4.5_${i/db_/}
  done
  mkdir -p ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 ${startdir}/src/db-${pkgver}/LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
}
