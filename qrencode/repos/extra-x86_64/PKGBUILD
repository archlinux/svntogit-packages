# Maintainer: Florian Pritz< flo@xinu.at>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=qrencode
pkgver=4.1.1
pkgrel=1
pkgdesc="C library for encoding data in a QR Code symbol."
arch=(x86_64)
depends=('libpng')
makedepends=(sdl)
url="https://fukuchi.org/works/qrencode/"
license=('GPL')
source=(https://fukuchi.org/works/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('de7185bcab635a34730e1b73d4efa705')

build() {
  cd "${srcdir}/$pkgname-$pkgver"

  ./configure --prefix=/usr

  make
}

check() {
  cd "${srcdir}/$pkgname-$pkgver"

  make check
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"

  make prefix="$pkgdir/usr" install
}
