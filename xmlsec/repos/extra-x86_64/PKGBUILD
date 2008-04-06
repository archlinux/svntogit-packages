# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Hussam Al-Tayeb <ht990332@gmail.com>
pkgname=xmlsec
pkgver=1.2.11
pkgrel=1
pkgdesc="XML Security Library is a C library based on LibXML2"
license=('custom')
arch=(i686 x86_64)
url="http://www.aleksey.com/xmlsec/index.html"
depends=('libxml2' 'libxslt' 'openssl' 'gnutls' 'nss')
makedepends=('pkgconfig')
options=('!libtool')
source=(http://www.aleksey.com/xmlsec/download/${pkgname}1-${pkgver}.tar.gz)
md5sums=('5652d44eec1375a399a6c61f5f6091f1')

build() {
  cd ${startdir}/src/${pkgname}1-${pkgver}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D -m644 ${startdir}/src/${pkgname}1-${pkgver}/COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
