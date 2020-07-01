# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=tslib
pkgver=1.22
pkgrel=1
pkgdesc="Touchscreen Access Library"
arch=(x86_64)
url="https://github.com/kergoth/tslib"
license=(GPL2)
depends=(glibc)
makedepends=()
source=("https://github.com/kergoth/tslib/releases/download/$pkgver/$pkgname-$pkgver.tar.xz"{,.asc})
sha256sums=('aaf0aed410a268d7b51385d07fe4d9d64312038e87c447ec8a24c8db0a15617a'
            'SKIP')
validpgpkeys=(F2082B880F9E423934686E3F500398DF5AB387D3) # Martin Kepplinger <martink@posteo.de>

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
