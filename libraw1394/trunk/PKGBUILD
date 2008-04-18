# $Id$
# Maintainer: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=libraw1394
pkgver=1.3.0
pkgrel=1
arch=(i686 x86_64)
license=('LGPL')
pkgdesc="Provides an API to the Linux IEEE1394 (FireWire) driver"
depends=('glibc')
url="http://www.linux1394.org/"
options=(!libtool)
source=(http://www.linux1394.org/dl/${pkgname}-${pkgver}.tar.gz)
md5sums=('c5d9ab62bd25dba96af010b3471e816a')

build() {
   cd ${startdir}/src/${pkgname}-${pkgver}
   ./configure --prefix=/usr
   make || return 1
   make DESTDIR=${startdir}/pkg install
}
