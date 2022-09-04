# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Adam Fontenot <fontenot@ucla.edu>

pkgname=libheif
pkgver=1.13.0
pkgrel=2
pkgdesc='HEIF file format decoder and encoder'
arch=(x86_64)
url='https://github.com/strukturag/libheif'
license=(GPL3)
makedepends=(libjpeg libpng gdk-pixbuf2)
depends=(libde265 x265 aom)
optdepends=('libjpeg: for heif-convert and heif-enc' 'libpng: for heif-convert and heif-enc')
source=(https://github.com/strukturag/libheif/releases/download/v$pkgver/libheif-$pkgver.tar.gz)
sha256sums=('c20ae01bace39e89298f6352f1ff4a54b415b33b9743902da798e8a1e51d7ca1')
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
