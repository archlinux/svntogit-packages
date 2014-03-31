# Maintainer: Dave Reisner <d@falconindy.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

pkgname=yajl
pkgver=2.1.0
pkgrel=1
pkgdesc='Yet Another JSON Library'
arch=('i686' 'x86_64')
url='http://lloyd.github.com/yajl/'
license=('ISC')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lloyd/$pkgname/archive/$pkgver.tar.gz")
md5sums=('6887e0ed7479d2549761a4d284d3ecb0')

build() {
  cd "$pkgname-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
