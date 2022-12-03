# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Curtis Campbell <curtisjamescampbell@hotmail.com>

pkgname=usbutils
pkgver=015
pkgrel=2
pkgdesc="A collection of USB tools to query connected USB devices"
arch=(x86_64)
url="https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usbutils.git/"
license=(GPL2 GPL3)
depends=(glibc hwdata)
makedepends=(libusb systemd)
optdepends=(
  'python: for lsusb.py usage'
  'coreutils: for lsusb.py usage'
)
source=(https://www.kernel.org/pub/linux/utils/usb/usbutils/$pkgname-$pkgver.tar{.xz,.sign})
sha512sums=('cda0070138400703d7429d39dee49130aedaa704292531e6af57b347cc62422ca609540650926e74335f71d67d7d4655418be4824e1eb8a2b065c7b395feaa87'
            'SKIP')
b2sums=('1074c7159e9e6729f03f98e1f38fa0b3fef3e744b5297e6d97a5fc44ea374e2d5a0c481e14b2a034bca201048b1305c3877dbb15e3c4c04b228b4036048d8904'
        'SKIP')
validpgpkeys=('647F28654894E3BD457199BE38DBBDC86092693E')  # Greg Kroah-Hartman <gregkh@linuxfoundation.org>

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --datadir=/usr/share/hwdata
  make
}

package() {
  depends+=(
    libusb libusb-1.0.so
    systemd-libs libudev.so
  )

  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -vDm 644 NEWS -t "$pkgdir/usr/share/doc/$pkgname/"
}
