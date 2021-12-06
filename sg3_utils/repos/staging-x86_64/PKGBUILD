# Maintainer: Daniel Isenmann <daniel@archlinux.org>

pkgname=sg3_utils
pkgver=1.47
pkgrel=1
pkgdesc="Generic SCSI utilities"
arch=(x86_64)
url="http://sg.danny.cz/sg/sg3_utils.html"
license=('GPL' 'custom:BSD')
depends=('glibc')
source=(http://sg.danny.cz/sg/p/${pkgname}-${pkgver}.tar.xz)
sha512sums=('ef072b8f0012d0944e21d2134aff7125e24ea24d1cbbb1aa79160e844f9a60236f1e244437a3bc08a22a7e99f613adad4a05ae5cc3916ded5a72d162cd3aa163')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
