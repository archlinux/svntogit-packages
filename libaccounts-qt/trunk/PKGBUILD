# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=libaccounts-qt
pkgdesc='Qt-based client library for accessing the online accounts database'
pkgver=1.16
pkgrel=3
arch=(x86_64)
url='https://gitlab.com/accounts-sso/libaccounts-qt'
license=(LGPL)
depends=(libaccounts-glib qt5-base)
makedepends=(doxygen)
conflicts=(libaccounts-qt5)
provides=(libaccounts-qt5)
replaces=(libaccounts-qt5)
source=(https://gitlab.com/accounts-sso/libaccounts-qt/-/archive/VERSION_$pkgver/libaccounts-qt-VERSION_$pkgver.tar.gz)
sha256sums=('3e527b151ee87e851b0f027214bda1353d8e48e10a5b54109f1e4b7d422a7de3')

prepare() {
  cd $pkgname-VERSION_$pkgver
  sed -i 's|SUBDIRS  += Accounts tests|SUBDIRS += Accounts|' accounts-qt.pro
}

build() {
  cd $pkgname-VERSION_$pkgver
  qmake PREFIX=/usr LIBDIR=/usr/lib
  make
}

package() {
  cd $pkgname-VERSION_$pkgver
  make INSTALL_ROOT="$pkgdir" install

# Remove docs
  rm -r "$pkgdir"/usr/share
}
