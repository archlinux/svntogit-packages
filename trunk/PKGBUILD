# Maintainer: Florian Pritz< flo@xinu.at>
# Contributor: Dany Martineau <dany.luc.martineau@gmail.com>

pkgname=qrencode
pkgver=4.0.2
pkgrel=1
pkgdesc="C library for encoding data in a QR Code symbol."
arch=(x86_64)
depends=('libpng')
makedepends=(sdl)
url="https://fukuchi.org/works/qrencode/"
license=('GPL')
source=(https://fukuchi.org/works/${pkgname}/${pkgname}-${pkgver}.tar.bz2)
md5sums=('3eb64357f6fbdb68c27cb2e44e97280a')

build() {
  cd "${srcdir}/$pkgname-$pkgver"

  ./configure --prefix=/usr

  make
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"

  make prefix="$pkgdir/usr" install
}
