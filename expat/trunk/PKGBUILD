# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.4.5
pkgrel=2
pkgdesc="An XML parser library"
arch=(x86_64)
url="https://libexpat.github.io/"
license=(MIT)
depends=(glibc)
makedepends=(cmake)
provides=(libexpat.so)
options=(debug)
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/${pkgname}-${pkgver}.tar.bz2"{,.asc})
sha512sums=('904c0631689f2a4092a544959d8b917b34563762075e49a7b7aa40533bfd7d89b46113d1a58477c2bc3a0abf9b68408b43ac13e82da01f79ac79466bcf2edbf9'
            'SKIP')
b2sums=('51c039e300972e8097484163227f9a48e822949846e5b34652ba848a8c142349c34f33f75461a44eeec9a0d68a69a79134410b661a2f50576c9fca387cfc26d6'
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
