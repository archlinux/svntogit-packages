# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=sdparm
pkgver=1.12
pkgrel=1
pkgdesc="An utility similar to hdparm but for SCSI devices"
arch=('x86_64')
url="http://sg.danny.cz/sg/sdparm.html"
license=('BSD')
depends=('glibc' 'bash')
source=(http://sg.danny.cz/sg/p/${pkgname}-${pkgver}.tar.xz)
sha512sums=('37d562271bd9aba34cce3b74f4bcdbe2fcad52e37399fbfb5b457c0e38e04f9376f97547b930643ec870998d82a08ac6a9c93c94b217fcc4c059adda5315fca5')

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
