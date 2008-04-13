# $Id: PKGBUILD,v 1.4 2007/11/08 01:26:13 travis Exp $
# Maintainer: Travis Willard <travisw@wmpub.ca>
# Contributor: Brad Gordon <brad@rpgcyco.net>

pkgname=libmcs
pkgver=0.7.0
pkgrel=1
pkgdesc="A library and userland tools which abstract the storage of configuration settings"
arch=('i686')
url="http://www.atheme.org/projects/mcs.shtml"
license=('BSD')
depends=('glibc' 'libmowgli')
makedepends=('pkgconfig')
source=(http://distfiles.atheme.org/${pkgname}-${pkgver}.tgz)
options=('!libtool')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install

  install -D -m0644 $startdir/src/${pkgname}-${pkgver}/COPYING \
                    $startdir/pkg/usr/share/licenses/$pkgname/COPYING

}

md5sums=('69b46ae0a929f9c7bc480128f12586a3')
md5sums=('0f0c779609b3481a79937c2e86660a99')
