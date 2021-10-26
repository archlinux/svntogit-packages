# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=c-ares
pkgver=1.18.0
pkgrel=1
pkgdesc="A C library for asynchronous DNS requests"
arch=('x86_64')
url="https://c-ares.haxx.se/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
provides=('libcares.so')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgname//-}-${pkgver//./_}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha512sums=('2fa74e334e9276560998547deec8ede841d5ff1dc98ae724a527438efa3c353f57fbd5dfe8866b419c16dbc0cd657e38cd7aa200b3bf0ab682c5fffff19da34f'
            'SKIP')
b2sums=('74986664dd53835a7bbbdfb03f6892e3be50566946d2ed900e717baeebced5b81133b189bfbdd346117c8ed26d798a7ce30cda3bd2c8c2f90fc716f0729049a8'
        'SKIP')
validpgpkeys=('27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2') # Daniel Stenberg <daniel@haxx.se>

build() {
  cd "$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE='None' \
        -Wno-dev \
        -B build \
        -S .
  make VERBOSE=1 -C build
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install -C build
  install -vDm 644 "LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -vDm 644 {AUTHORS,CHANGES,{CONTRIBUTING,README}.md,RELEASE-NOTES} \
    -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
