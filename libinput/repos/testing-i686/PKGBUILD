# $Id: $
# Maintainer: Jan de Groot

pkgname=libinput
pkgver=0.2.0
pkgrel=1
pkgdesc="library that handles input devices for display servers and other applications that need to directly deal with input devices."
arch=(i686 x86_64)
url="http://www.freedesktop.org/wiki/Software/libinput/"
license=(custom:X11)
depends=('mtdev' 'libsystemd' 'libevdev')
makedepends=('systemd')
options=('!libtool')
source=(http://freedesktop.org/software/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('822bad40cac1fa90e38569da189a989d4b5f8ef58ec6bc6fefef8b78f825599c')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
