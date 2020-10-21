# Maintainer:  David Runge <dvzrv@archlinux.org>
# Contributor:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.2.10
pkgrel=2
pkgdesc='An XML parser library'
arch=('x86_64')
url="https://libexpat.github.io/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
provides=('libexpat.so')
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/expat-${pkgver}.tar.bz2"{,.asc})
sha512sums=('9623e86024d09e3bb0cf51fd0d56ecaee5fb8c8acb71589104a63b510f73c1e84abb0ccea4e2c196bdf1d30b5ad0633a915758f75813717d031d633e34f022b7'
            'SKIP')
b2sums=('e837353deb2fa6a9fbeff9c1843e63f33a1622bf26f6a914a1e2e572324d4826165bf175ac13038666c8e4eb785167bd3dafe7bc5b4c98e92e608f20709f053d'
        'SKIP')
validpgpkeys=(3176EF7DB2367F1FCA4F306B1F9B0E909AF37285) # Sebastian Pipping

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -W no-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

check() {
  cd "$pkgname-$pkgver"
  make VERBOSE=1 -C build test
}

package() {
  cd "$pkgname-$pkgver"
  make VERBOSE=1 DESTDIR="$pkgdir" -C build install
  install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/$pkgname/"
  install -vDm 644 {AUTHORS,Changes,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
