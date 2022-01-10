# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Curtis Campbell <curtisjamescampbell@hotmail.com>

pkgname=usbutils
pkgver=014
pkgrel=2
pkgdesc="A collection of USB tools to query connected USB devices"
arch=('x86_64')
url="https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usbutils.git/"
license=('GPL2' 'GPL3')
depends=('glibc' 'hwdata')
makedepends=('libusb' 'systemd')
optdepends=('python: for lsusb.py usage'
            'coreutils: for lsusb.py usage')
source=("https://www.kernel.org/pub/linux/utils/usb/usbutils/${pkgname}-${pkgver}.tar"{.xz,.sign})
sha512sums=('43c9f6ed14f8d01e014ef39a5d50b3b09031c6bda8261e0945b4cb4287c9107104175b386c2adc61dc7f9f476afb30f9a647a6ece6dee26b4133a4f10af72792'
            'SKIP')
b2sums=('aea4f8edd3c7d7bc400fd63a8702b6d0bb50b8ed07196c4a0ed20a615eacf6373794afb9e7d5d81408dc3382848e965ecf8bc1bbec20837e4d1f96ba47cc40b5'
        'SKIP')
validpgpkeys=('647F28654894E3BD457199BE38DBBDC86092693E') # Greg Kroah-Hartman <gregkh@linuxfoundation.org>

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -fiv
}

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr \
              --datadir=/usr/share/hwdata
  make
}

package() {
  depends+=('libusb-1.0.so' 'libudev.so')
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -vDm 644 NEWS -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
