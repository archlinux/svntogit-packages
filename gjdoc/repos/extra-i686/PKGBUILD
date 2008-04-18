# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gjdoc
pkgver=0.7.8
pkgrel=4
pkgdesc="GNU Classpath JavaDoc implementation"
arch=(i686 x86_64)
license=('GPL')
url="http://savannah.gnu.org/projects/classpath/"
depends=('gcc-gcj>=4.3.0')
makedepends=('antlr')
options=('!libtool')
source=(http://ftp.gnu.org/gnu/classpath/${pkgname}-${pkgver}.tar.gz)
md5sums=('a60c6bb229025120412b8a9d69ef1800')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
