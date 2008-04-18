# $Id$
# Maintainer: Judd Vinet <jvinet@zeroflux.org>
# Contributor: Curtis Campbell <curtisjamescampbell@hotmail.com>
pkgname=usbutils
pkgver=0.73
pkgrel=5
pkgdesc="USB Device Utilities"
arch=(i686 x86_64)
license=('GPL')
groups=('base')
makedepends=('wget')
depends=('glibc' 'libusb')
url="http://usb.cs.tum.edu/"
source=(http://downloads.sourceforge.net/sourceforge/linux-usb/usbutils-$pkgver.tar.gz)
md5sums=('88978b4ad891f610620b1b8e5e0f43eb')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./update-usbids.sh
  sed -i 's|DEST=|&/usr/share/hwdata/|' update-usbids.sh
  ./configure --prefix=/usr --datadir=/usr/share/hwdata --enable-usbmodules --disable-zlib
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m755 update-usbids.sh $startdir/pkg/usr/sbin/update-usbids
}
