# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=c-ares
pkgver=1.19.0
pkgrel=1
pkgdesc="A C library for asynchronous DNS requests"
arch=(x86_64)
url="https://c-ares.haxx.se/"
license=(MIT)
depends=(glibc)
makedepends=(cmake)
provides=(libcares.so)
source=(https://github.com/$pkgname/$pkgname/releases/download/${pkgname//-}-${pkgver//./_}/$pkgname-$pkgver.tar.gz{,.asc})
sha512sums=('a7f5988bef393afec08a225be92f6eee54a3e67170fb26cbe00dcc5c5a457b27037bbcfeccc39fb855ed72f100196958d6cbbe251bf1ccfbdd353be18f098359'
            'SKIP')
b2sums=('d77be535dfa852bf3d91258ddf06b3c63a40123883adb83a4e5652d4b1b16801ddefefad70d83a7d6d9aa81c9c81956fef42bc778d7380d6b398ccfc9f8b82dc'
        'SKIP')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg <daniel@haxx.se>

build() {
  local cmake_options=(
    -B build
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_BUILD_TYPE=None
    -S $pkgname-$pkgver
    -Wno-dev
  )
  cmake "${cmake_options[@]}"
  cmake --build build --verbose
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -vDm 644 $pkgname-$pkgver/LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,CHANGES,{CONTRIBUTING,README}.md,RELEASE-NOTES} -t "$pkgdir/usr/share/doc/$pkgname/"
}
