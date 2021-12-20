# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.4.2
pkgrel=1
pkgdesc='An XML parser library'
arch=('x86_64')
url="https://libexpat.github.io/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
provides=('libexpat.so')
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/${pkgname}-${pkgver}.tar.bz2"{,.asc})
sha512sums=('7d82835e9b7789650b1890bce36e09683d4ae77813449281d1b5ac71efe4a3b63a21c6d2818b94bd88c05679ebf1471138c45bae582397bc7d67f02fb9de6592'
            'SKIP')
b2sums=('1a8a331da0b2251dc316ce0d3a66d3e799929b54856475452845c854ff1c866147a4d1708d7a019e225b79ef6a65a0116688120d3ef74e6cd67d3bb71a1f03f8'
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
