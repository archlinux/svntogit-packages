# $Id$
# Maintainer: Jason Chu <jason@archlinux.org>
pkgname=usbview
pkgver=1.0
pkgrel=1
pkgdesc="USB Viewer"
depends=('glibc' 'gtk>=1.2')
source=(http://www.kroah.com/linux-usb/$pkgname-$pkgver.tar.gz)
url="http://www.kroah.com/linux-usb/"

build() {
   cd $startdir/src/usbview-$pkgver
   ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
   make || return 1
   make prefix=$startdir/pkg/usr \
       sysconfdir=$startdir/pkg/etc \
       localstatedir=$startdir/pkg/var install
}
