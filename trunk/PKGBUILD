# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Curtis Campbell <curtisjamescampbell@hotmail.com>
pkgname=usbutils
pkgver=010
pkgrel=1
pkgdesc="USB Device Utilities"
arch=(x86_64)
license=('GPL')
groups=('base')
depends=('libusb' 'hwids')
optdepends=('python: for lsusb.py usage'
            'coreutils: for lsusb.py usage')
url="http://linux-usb.sourceforge.net/"
source=("http://www.kernel.org/pub/linux/utils/usb/usbutils/${pkgname}-${pkgver}.tar.xz")
md5sums=('938e3707593974be99a0dd6d1de76671')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr --datadir=/usr/share/hwdata --disable-zlib
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  # this is now in the hwids package
  rm -rf $pkgdir/usr/{share/hwdata,sbin}
}
