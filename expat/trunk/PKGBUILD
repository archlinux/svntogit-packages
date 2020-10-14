# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.2.10
pkgrel=1
pkgdesc='An XML parser library'
arch=(x86_64)
url='https://libexpat.github.io/'
license=(custom)
depends=(glibc)
makedepends=(cmake)
source=(https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/expat-${pkgver}.tar.bz2{,.asc})
validpgpkeys=(3176EF7DB2367F1FCA4F306B1F9B0E909AF37285) # Sebastian Pipping
sha512sums=('9623e86024d09e3bb0cf51fd0d56ecaee5fb8c8acb71589104a63b510f73c1e84abb0ccea4e2c196bdf1d30b5ad0633a915758f75813717d031d633e34f022b7'
            'SKIP')

build() {
  cd $pkgname-$pkgver
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -S . -B build
  cmake --build build
}

check() {
  cd $pkgname-$pkgver
  cmake --build build --target tests
}

package() {
  cd $pkgname-$pkgver
  cmake --build build --target install -- DESTDIR="$pkgdir"
  install -Dm644 "-t$pkgdir/usr/share/licenses/$pkgname" COPYING
}
