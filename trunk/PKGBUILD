# $Id$
# Maintainer: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
pkgname=mcpp
pkgver=2.6.4
pkgrel=2
pkgdesc="Matsui's CPP implementation precisely conformed to standards"
arch=(i686 x86_64)
license=('custom:')
url="http://mcpp.sourceforge.net"
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz \
        mcpp-2.6.4-patch)
depends=(glibc)

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  patch -Np0 -i ${startdir}/src/mcpp-2.6.4-patch || return 1
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install

  mkdir -p ${startdir}/pkg/usr/share/licenses/${pkgname}
  install -m644 ${startdir}/src/${pkgname}-${pkgver}/LICENSE \
                ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
}
md5sums=('c0f5aa9b13e36ea0f2ab9358c5d65153'
         '80890eb2988d7e80964b814cf134f842')
