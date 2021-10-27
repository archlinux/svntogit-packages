# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Dave Reisner <dreisner@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=c-ares
pkgver=1.18.1
pkgrel=1
pkgdesc="A C library for asynchronous DNS requests"
arch=('x86_64')
url="https://c-ares.haxx.se/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
provides=('libcares.so')
source=("https://github.com/${pkgname}/${pkgname}/releases/download/${pkgname//-}-${pkgver//./_}/${pkgname}-${pkgver}.tar.gz"{,.asc})
sha512sums=('1276ec0799916019f8c0af6b55a139701bd15e0ca4a00811d07963893978bc96c107b980f0fd49f81aa70bc8b3b8cd671195ba357c390772d4c2c5643c50c5a5'
            'SKIP')
b2sums=('c03a572726c6bbb24a3e4773673d0c87f4833bb9582aed57a424eea8c965beb6e232f502b61922b124d37403d91ebfefe0db7373673fc22e0d752c4e5036eb07'
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
