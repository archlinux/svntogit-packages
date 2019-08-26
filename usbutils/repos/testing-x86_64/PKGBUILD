# Maintainer: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Curtis Campbell <curtisjamescampbell@hotmail.com>
pkgname=usbutils
pkgver=012
pkgrel=1
pkgdesc="USB Device Utilities"
arch=(x86_64)
license=('GPL')
groups=('base')
depends=('libusb' 'hwids')
optdepends=('python: for lsusb.py usage'
            'coreutils: for lsusb.py usage')
url="http://linux-usb.sourceforge.net/"
source=("https://www.kernel.org/pub/linux/utils/usb/usbutils/${pkgname}-${pkgver}.tar"{.xz,.sign})
md5sums=('0da98eb80159071fdbb00905390509d9'
         'SKIP')
validpgpkeys=('647F28654894E3BD457199BE38DBBDC86092693E') # Greg Kroah-Hartman <gregkh@linuxfoundation.org>

build() {
  cd $srcdir/$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr --datadir=/usr/share/hwdata --disable-zlib
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  # this is now in the hwids package
  rm -rf $pkgdir/usr/{share/hwdata,sbin}
}
