# Contributor: Giovanni Scafora <linuxmania@gmail.com>

pkgname=ipw3945-ucode
pkgver=1.14.2
pkgrel=2
pkgdesc="Intel Centrino Drivers firmware for IPW3945"
arch=(i686 x86_64)
url="http://www.bughost.org/ipw3945"
license=""
depends=('udev')
install=ipw3945-ucode.install
source=(http://www.bughost.org/ipw3945/ucode/$pkgname-$pkgver.tgz)


build() {
  cd $startdir/src/$pkgname-$pkgver
  #Install firmware
  install -D -m 644 ipw3945.ucode $startdir/pkg/lib/firmware/ipw3945.ucode
  # Install firmware license
  install -D -m 644 LICENSE.ipw3945-ucode $startdir/pkg/lib/firmware/LICENSE.ipw3945-ucode
}
md5sums=('c1c4cc7f993f448e7c05768c012084aa')
