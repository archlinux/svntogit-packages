# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Curtis Campbell <curtisjamescampbell@hotmail.com>

pkgname=usbutils
pkgver=015
pkgrel=1
pkgdesc="A collection of USB tools to query connected USB devices"
arch=('x86_64')
url="https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usbutils.git/"
license=('GPL2' 'GPL3')
depends=('glibc' 'hwdata')
makedepends=('git' 'libusb' 'systemd')
optdepends=('python: for lsusb.py usage'
            'coreutils: for lsusb.py usage')
source=("git+https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usbutils.git#commit=79b796f9")
sha512sums=('SKIP')
validpgpkeys=('647F28654894E3BD457199BE38DBBDC86092693E') # Greg Kroah-Hartman <gregkh@linuxfoundation.org>

prepare() {
  cd "$pkgname"
  autoreconf -fiv
}

build() {
  cd "$pkgname"
  ./configure --prefix=/usr \
              --datadir=/usr/share/hwdata
  make
}

package() {
  depends+=('libusb-1.0.so' 'libudev.so')
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  install -vDm 644 NEWS -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
