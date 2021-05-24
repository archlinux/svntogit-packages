# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.4.0
pkgrel=1
pkgdesc='An XML parser library'
arch=('x86_64')
url="https://libexpat.github.io/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
provides=('libexpat.so')
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/${pkgname}-${pkgver}.tar.bz2"{,.asc})
sha512sums=('8c6237d18b4d9d1bc7b0b7eab7414ac07e93a991a18188515427e0790a05b3c496502be5a851b3f8e8c9da67649862779a99c59a7cb2e9bae40685ad1d03e2b5'
            'SKIP')
b2sums=('31edd7855e97bb2f440f3e34b4f9f5de31496a78091fb01f2b18d83c07f8a32a4951aad9ccaf338f586d43f66f29fbab6fe98d017012b4d1fb2d6ac64c0476d8'
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
