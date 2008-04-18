# $Id$
# Maintainer: judd <jvinet@zeroflux.org>

pkgname=libtasn1
pkgver=1.3
pkgrel=1
pkgdesc="The ASN.1 library used in GNUTLS"
arch=(i686 x86_64)
license=('GPL' 'LGPL')
url="http://www.gnu.org/software/gnutls/"
depends=('glibc')
options=('!libtool')
source=(ftp://ftp.gnutls.org/pub/gnutls/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('8e6c9d4760f70758e64fe9d70d5ccfea')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
}
