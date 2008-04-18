#$Id$
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
pkgname=sg3_utils
pkgver=1.25
pkgrel=1
pkgdesc="Generic SCSI utilities"
arch=(i686 x86_64)
url="http://sg.torque.net/sg/sg3_utils.html"
license=('GPL' 'custom:BSD')
depends=('glibc')
options=('!libtool')
source=(http://sg.torque.net/sg/p/${pkgname}-${pkgver}.tgz)
md5sums=('9fec4d8f3f6c8b3d2da79fc17cc2d387')

build() {
  cd ${startdir}/src/${pkgname}-${pkgver}
  ./configure --prefix=/usr 
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D -m644 COPYING $startdir/pkg/usr/share/licenses/$pkgname/COPYING
}
