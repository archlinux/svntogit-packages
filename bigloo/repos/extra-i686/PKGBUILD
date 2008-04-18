# $Id$
# Contributor: John Proctor <jproctor@prium.net>
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=bigloo
pkgver=3.0c
_realver=3.0c-4
pkgrel=1
pkgdesc="Fast scheme compiler"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
depends=('openssl' 'sqlite3')
makedepends=('jdk')
url='http://www-sop.inria.fr/mimosa/fp/Bigloo/'
source=(ftp://ftp-sop.inria.fr/mimosa/fp/Bigloo/${pkgname}${_realver}.tar.gz)
md5sums=('449b5f45a1b02619b9cf2a76f94232ee')

build() {
  cd ${startdir}/src/${pkgname}${pkgver}
  export MAKEFLAGS="-j1"
  ./configure --prefix=/usr --dotnet=no --javaprefix=/opt/java/bin
  make || return 1
  make DESTDIR=${startdir}/pkg install
  (cd ${startdir}/pkg/usr/bin; rm bigloo; ln -s bigloo${pkgver} bigloo)
}
