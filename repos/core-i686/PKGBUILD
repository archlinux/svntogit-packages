# $Id$
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgname=mpfr
pkgver=2.3.1
pkgrel=1
pkgdesc="multiple-precision floating-point library"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://www.mpfr.org/"
depends=('gmp>=4.2.2')
options=('!libtool')
source=(http://www.mpfr.org/mpfr-current/mpfr-${pkgver}.tar.gz)
md5sums=('cf882c61f5da60c9f3a61746b8264dd2')
		  
build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-thread-safe --enable-shared || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
