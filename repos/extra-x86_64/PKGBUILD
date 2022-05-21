# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=libstaroffice
pkgver=0.0.7
pkgrel=2
pkgdesc="filter for old StarOffice documents(.sdc, .sdw, ...) based on librevenge"
url="https://github.com/fosnola/libstaroffice"
arch=('x86_64')
license=('MPL2' 'LGPL2.1')
depends=('librevenge')
makedepends=('doxygen')
source=(https://github.com/fosnola/$pkgname/releases/download/$pkgver/libstaroffice-$pkgver.tar.xz)
sha256sums=('f94fb0ad8216f97127bedef163a45886b43c62deac5e5b0f5e628e234220c8db')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make check
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
