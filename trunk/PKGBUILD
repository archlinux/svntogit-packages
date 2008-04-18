# $Id$
# Maintainer: dorphell <dorphell@archlinux.org>

pkgname=gnutls
pkgver=2.0.4
pkgrel=1
pkgdesc="A library which provides a secure layer over a reliable transport layer"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://www.gnu.org/software/gnutls/"
options=('libtool')
depends=('gcc-libs' 'opencdk>=0.6.6' 'libtasn1>=1.1' 'lzo2' 'readline')
source=(ftp://ftp.gnutls.org/pub/gnutls/${pkgname}-${pkgver}.tar.bz2)
md5sums=('0d3c959ff2b3b71f840038c3441ba1f9')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-zlib --disable-guile
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
