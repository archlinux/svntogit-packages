# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.2.9
pkgrel=3
pkgdesc='An XML parser library'
arch=(x86_64)
url='https://libexpat.github.io/'
license=(custom)
depends=(glibc)
makedepends=(cmake)
source=(https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/expat-${pkgver}.tar.bz2{,.asc})
validpgpkeys=(3176EF7DB2367F1FCA4F306B1F9B0E909AF37285) # Sebastian Pipping
sha256sums=('f1063084dc4302a427dabcca499c8312b3a32a29b7d2506653ecc8f950a9a237'
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
