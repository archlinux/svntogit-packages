# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Adam Fontenot <fontenot@ucla.edu>

pkgname=libheif
pkgver=1.14.1
pkgrel=1
pkgdesc='HEIF file format decoder and encoder'
arch=(x86_64)
url='https://github.com/strukturag/libheif'
license=(GPL3)
makedepends=(libjpeg libpng gdk-pixbuf2)
depends=(libde265 x265 aom)
optdepends=('libjpeg: for heif-convert and heif-enc' 'libpng: for heif-convert and heif-enc')
source=(https://github.com/strukturag/libheif/releases/download/v$pkgver/libheif-$pkgver.tar.gz)
sha256sums=('0634646587454f95e9638ca472a37321aa519fca2ec7405d0e02a74d7ee581db')
options=(debug)

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --enable-static=no
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
