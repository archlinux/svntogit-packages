# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.4.4
pkgrel=1
pkgdesc="An XML parser library"
arch=(x86_64)
url="https://libexpat.github.io/"
license=(MIT)
depends=(glibc)
makedepends=(cmake)
provides=(libexpat.so)
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/${pkgname}-${pkgver}.tar.bz2"{,.asc})
sha512sums=('ef2df46899f3dc8f9733b7450396366c7d3d38b6b286f65b0ffa0f88c60814340c31ba8545a9b627469ca589c3de46f703490e0388160f0310cd891780684867'
            'SKIP')
b2sums=('4743e8477909168241312d3f72f7c5dbc88921e60d96c4111d1bd0f1a94db106b6c764b340275d7d746f316d4e32e6a5aabd27fc599fda7ae6d68e0f0d744999'
        'SKIP')
validpgpkeys=(3176EF7DB2367F1FCA4F306B1F9B0E909AF37285) # Sebastian Pipping

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -W no-dev \
        -B build \
        -S "$pkgname-$pkgver"
  make VERBOSE=1 -C build
}

check() {
  make VERBOSE=1 -C build test
}

package() {
  make VERBOSE=1 DESTDIR="$pkgdir" -C build install
  install -vDm 644 "$pkgname-$pkgver/COPYING" -t "${pkgdir}/usr/share/licenses/$pkgname/"
  install -vDm 644 "$pkgname-$pkgver/"{AUTHORS,Changes,README.md} -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
