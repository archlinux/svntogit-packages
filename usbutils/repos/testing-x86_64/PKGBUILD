# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Curtis Campbell <curtisjamescampbell@hotmail.com>

pkgname=usbutils
pkgver=013
pkgrel=1
pkgdesc="A collection of USB tools to query connected USB devices"
arch=('x86_64')
url="https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usbutils.git/"
license=('GPL2')
depends=('glibc' 'hwids')
makedepends=('libusb' 'systemd')
optdepends=('python: for lsusb.py usage'
            'coreutils: for lsusb.py usage')
source=("https://www.kernel.org/pub/linux/utils/usb/usbutils/${pkgname}-${pkgver}.tar"{.xz,.sign})
sha512sums=('eb1751e5b82f7a1bdffc667662cebee6fd42f466e59d4eb4c98f0d3723d740305377da1df1ba5831402fddbbd1697bbfa2abd22d9ed175e2dee55d6d007e9e54'
            'SKIP')
b2sums=('d6e7925e180ba90f27ca12f13ed985f34e51b230ec08188c91bf39bb8e64baa319aa63d473318e1a4cb21b53808e8610f837ea0bb85657072f1c70107d037873'
        'SKIP')
validpgpkeys=('647F28654894E3BD457199BE38DBBDC86092693E') # Greg Kroah-Hartman <gregkh@linuxfoundation.org>

prepare() {
  cd "$pkgname-$pkgver"
  autoreconf -vfi
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
  install -vDm 644 {README.md,NEWS} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
