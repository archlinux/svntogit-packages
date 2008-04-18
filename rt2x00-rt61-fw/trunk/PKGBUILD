# $Id$
# Maintainer: Tom Killian <tom@archlinux.org>

pkgname=rt2x00-rt61-fw
pkgver=1.2
pkgrel=2
pkgdesc="Firmware for the rt2x00 wireless drivers"
arch=(i686 x86_64)
url="http://www.ralinktech.com/ralink/Home/Support/Linux.html"
license=('RALINK')
source=(http://www.ralinktech.com.tw/data/RT61_Firmware_V${pkgver}.zip)

build() {
  cd $startdir/src/RT61_Firmware_V${pkgver}
  mkdir -p $startdir/pkg/lib/firmware
  install -m644 rt2* $startdir/pkg/lib/firmware || return 1
}
md5sums=('d4c690c93b470bc9a681297c2adc6281')
