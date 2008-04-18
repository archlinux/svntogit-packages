# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Lucien Immink <l.immink@student.fnt.hvu.nl>

pkgname=curl
pkgver=7.18.1
pkgrel=1
pkgdesc="An URL retrival utility and library"
arch=('i686' 'x86_64')
url="http://curl.haxx.se"
license=('MIT')
depends=('zlib' 'openssl>=0.9.8b' 'bash')
options=('!libtool')
source=(http://curl.haxx.se/download/${pkgname}-${pkgver}.tar.bz2)
md5sums=('805834fc1136ff7600d2179bc0386c5a')
sha1sums=('685b9388ee9e646158a83cd435f7be664816ad78')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr --without-libidn --disable-ldap
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D -m644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
