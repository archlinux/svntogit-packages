# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: arjan <arjan@archlinux.org>
# Contributor Sarah Hay <sarahhay@mb.sympatico.ca>

pkgname=libdvdcss
pkgver=1.4.3
pkgrel=1
pkgdesc="Portable abstraction library for DVD decryption"
url="https://www.videolan.org/developers/libdvdcss.html"
arch=('x86_64')
license=('GPL')
depends=('glibc')
options=('!docs' '!emptydirs')
source=(https://download.videolan.org/pub/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('233cc92f5dc01c5d3a96f5b3582be7d5cee5a35a52d3a08158745d3d86070079')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
