# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.3.0
pkgrel=1
pkgdesc='An XML parser library'
arch=('x86_64')
url="https://libexpat.github.io/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
provides=('libexpat.so')
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/${pkgname}-${pkgver}.tar.bz2"{,.asc})
sha512sums=('937468f2c298503a2c8d3f70b36e2c79d6b603e758abe0613fd2b636d3cf6906946776fdfe6725a8d6e90748ed7f7f07ad0d7a07c4328f6669bc89482c0e535b'
            'SKIP')
b2sums=('cac52d8f67a1019985b5568ed1baf9adfda2366a67374fc1e97db0493b1e528805d916e33bd69ab34cd88debef05082a271534e475cfa22c11bff5157bbc70c2'
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
