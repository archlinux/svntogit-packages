# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.2.7
pkgrel=1
pkgdesc='An XML parser library'
arch=(x86_64)
url='https://libexpat.github.io/'
license=(custom)
depends=(glibc)
source=(https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/expat-${pkgver}.tar.bz2{,.asc})
validpgpkeys=(3D7E959D89FACFEE38371921B00BC66A401A1600) # Sebastian Pipping
sha256sums=('cbc9102f4a31a8dafd42d642e9a3aa31e79a0aedaa1f6efd2795ebc83174ec18'
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
