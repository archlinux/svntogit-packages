# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=c-ares
pkgver=1.17.2
pkgrel=1
pkgdesc="A C library for asynchronous DNS requests"
arch=('x86_64')
url="https://c-ares.haxx.se/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
provides=('libcares.so')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgname//-}-${pkgver//./_}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha512sums=('f625e0ef8508af6475d3e83b51ab29be8a4878e2a87e7f518bea046b76a74bfde7043ca6ec2a9e714c898ab9e5d4a5a678c3347a9f9eb68980438f7ca8ae3fc8'
            'SKIP')
b2sums=('c6f5ad65ca75f8467b624daf3caaee2f35d6e4714ce46ebe1bbf79447feecf8615915b00fa5e7bd1e97c6232864e06c53a792fbadf36a5399883529769273e24'
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
