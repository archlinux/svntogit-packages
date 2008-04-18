# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libffi
pkgver=4.2.0
pkgrel=1
pkgdesc="A portable, high level programming interface to various calling conventions."
arch=('i686' 'x86_64')
license=('custom')
url="http://sourceware.org/libffi"
depends=('glibc')
options=('!libtool')
source=(ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-{core,java}-${pkgver}.tar.bz2)
md5sums=('de693d0917d710c3de41297d574470f5'
         '4c0377d27258f10b1066da9c0a6fbe32')

build() {
  cd ${startdir}/src
  mkdir gcc-build
  cd gcc-build
  ../gcc-${pkgver}/libffi/configure --prefix=/usr \
    --enable-shared --libdir=/usr/lib --disable-multilib
  make || return 1
  make DESTDIR=${startdir}/pkg install
  mv ${startdir}/pkg/usr/lib/gcc/${pkgver}/include ${startdir}/pkg/usr/include
  rm -rf ${startdir}/pkg/usr/lib/gcc
  mkdir -p ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 ${startdir}/src/gcc-${pkgver}/${pkgname}/LICENSE \
                ${startdir}/pkg/usr/share/licenses/${pkgname}/
}
