# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Adam Fontenot <fontenot@ucla.edu>

pkgname=libheif
pkgver=1.12.0
pkgrel=3
pkgdesc="HEIF file format decoder and encoder"
arch=(x86_64)
url="https://github.com/strukturag/libheif"
license=(GPL3)
makedepends=(libjpeg libpng gdk-pixbuf2)
depends=(libde265 x265 aom)
optdepends=('libjpeg: for heif-convert and heif-enc' 'libpng: for heif-convert and heif-enc')
source=(https://github.com/strukturag/libheif/releases/download/v$pkgver/libheif-$pkgver.tar.gz)
sha256sums=('e1ac2abb354fdc8ccdca71363ebad7503ad731c84022cf460837f0839e171718')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-static=no
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
