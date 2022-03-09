# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=signond
pkgver=8.61
pkgrel=1
pkgdesc='A D-Bus service which performs user authentication on behalf of its clients'
arch=(x86_64)
url='https://gitlab.com/accounts-sso/signond/'
license=(LGPL)
depends=(qt5-base)
makedepends=(doxygen graphviz ttf-font qt5-tools)
source=(https://gitlab.com/accounts-sso/signond/-/archive/VERSION_$pkgver/signond-VERSION_$pkgver.tar.bz2)
sha256sums=('5d9f29fbf5892d01e38ce931b9a69c4bb08e6788f6cbdc80c277f4723b44249d')

build() {
  cd $pkgname-VERSION_$pkgver
  qmake PREFIX=/usr LIBDIR=/usr/lib
  make
}

package() {
  cd $pkgname-VERSION_$pkgver
  make INSTALL_ROOT="$pkgdir" install

  # Do not ship docs
  rm -rf "$pkgdir"/usr/share/doc
}
