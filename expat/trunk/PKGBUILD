# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.5.0
pkgrel=1
pkgdesc="An XML parser library"
arch=(x86_64)
url="https://libexpat.github.io/"
license=(MIT)
depends=(glibc)
makedepends=(cmake)
provides=(libexpat.so)
source=(https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/$pkgname-$pkgver.tar.bz2{,.asc})
sha512sums=('22fd904d75aab7506a85c03519b9cf79e44898c8e1ba6abf6cb7f95de71b8e63a7e2d5cf4395e3627d46035ea29342b3e631a8809fef8aad3f59976dc075ad17'
            'SKIP')
b2sums=('15a5dcd3af17995fb4299301710b38d609c1fe7a8d6a6284581fedd96e89e0c16526d0342fb55773ac9d678cd65dc5cdb1532c764eeb3a20ccdf1e168b96e337'
        'SKIP')
validpgpkeys=(3176EF7DB2367F1FCA4F306B1F9B0E909AF37285) # Sebastian Pipping

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -W no-dev \
        -B build \
        -S $pkgname-$pkgver
  make VERBOSE=1 -C build
}

check() {
  make VERBOSE=1 -C build test
}

package() {
  make VERBOSE=1 DESTDIR="$pkgdir" -C build install
  install -vDm 644 $pkgname-$pkgver/COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,Changes,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
