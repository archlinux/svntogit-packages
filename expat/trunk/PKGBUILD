# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=expat
pkgver=2.4.9
pkgrel=1
pkgdesc="An XML parser library"
arch=(x86_64)
url="https://libexpat.github.io/"
license=(MIT)
depends=(glibc)
makedepends=(cmake)
provides=(libexpat.so)
options=(debug)
source=("https://github.com/libexpat/libexpat/releases/download/R_${pkgver//./_}/${pkgname}-${pkgver}.tar.bz2"{,.asc})
sha512sums=('fdfdc57dd11541eb307b38bd97ec84f78012c7b48fafc5c879b4b8c768cabfbcd7652ccec11e870bf31fee8f68174b22cf632de12c8c46601277f6750f90c192'
            'SKIP')
b2sums=('d60183f96f3359acc069af638cc8d16ba19f51fbd8a61eddd80c2babddde357dcf0561e87af901f53617bfd9452e146c9dd9f317729cd3648b65832a38388640'
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
