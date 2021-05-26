# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.4.1
pkgrel=1
pkgdesc='An XML parser library'
arch=('x86_64')
url="https://libexpat.github.io/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
provides=('libexpat.so')
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/${pkgname}-${pkgver}.tar.bz2"{,.asc})
sha512sums=('b24e19c3f91e0f3d1ad3b08a810b8874e272ddfc6d4fd8f79c14c13eddf410648343b9f69fba2ce165be46c143cecf8d66cf446b4930da42f92def555ecd3408'
            'SKIP')
b2sums=('47a39b63023cc1a4bdb56a5b2e6a51d9dfdeb69b8d4138e9f822a48ab07b01ceff00dcadbce688a4d069961e99746f692f616c5a62d69cec2bd5f74c6066c317'
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
