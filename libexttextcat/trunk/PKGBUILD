# Maintainer: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=libexttextcat
pkgver=3.4.6
pkgrel=1
pkgdesc="N-Gram-Based Text Categorization library primarily intended for language guessing"
arch=('x86_64')
url="https://wiki.documentfoundation.org/Libexttextcat"
license=('custom')
depends=('glibc')
provides=('libtextcat')
source=(https://dev-www.libreoffice.org/src/$pkgname/$pkgname-$pkgver.tar.xz)
sha256sums=('6d77eace20e9ea106c1330e268ede70c9a4a89744ddc25715682754eca3368df')

build() {
  cd "${srcdir}"/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE
}
