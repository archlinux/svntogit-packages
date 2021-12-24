# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Andrej Gelenberg <andrej.gelenberg@udo.edu>

pkgname=yajl
pkgver=2.1.0
pkgrel=5
pkgdesc='Yet Another JSON Library'
arch=('x86_64')
url='https://lloyd.github.com/yajl/'
license=('ISC')
depends=('glibc')
makedepends=('cmake')
provides=('libyajl.so')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lloyd/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('9e786d080803df80ec03a9c2f447501e6e8e433a6baf636824bc1d50ecf4f5f80d7dfb1d47958aeb0a30fe459bd0ef033d41bc6a79e1dc6e6b5eade930b19b02')
b2sums=('755ee1d9f8c59b730393468722dae9148cd63443a0c91f0e1894f5998b699303920b8f0748541bd280d132ee1c9dedd40ebc2a7e020a8fe65beb186f25af5402')

build() {
  cd "$pkgname-$pkgver"
  export CFLAGS+=" -ffat-lto-objects"
  cmake -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE='None' \
        -Wno-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

check() {
  cd "$pkgname-$pkgver"
  make VERBOSE=1 -C build test
  make VERBOSE=1 -C build test-api
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install -C build
  install -vDm 644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname}"
  install -vDm 644 {ChangeLog,README,TODO} -t "$pkgdir/usr/share/doc/${pkgname}"
}
