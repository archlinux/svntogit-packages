# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.2.6
pkgrel=1
pkgdesc='An XML parser library'
arch=(x86_64)
url='https://libexpat.github.io/'
license=(custom)
depends=(glibc)
source=(https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/expat-${pkgver}.tar.bz2{,.asc})
validpgpkeys=(3D7E959D89FACFEE38371921B00BC66A401A1600) # Sebastian Pipping
sha256sums=('17b43c2716d521369f82fc2dc70f359860e90fa440bea65b3b85f0b246ea81f2'
            'SKIP')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  make -C $pkgname-$pkgver check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 "-t$pkgdir/usr/share/licenses/$pkgname" COPYING
}
