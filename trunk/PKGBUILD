# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Adam Fontenot <fontenot@ucla.edu>

pkgname=libheif
pkgver=1.6.1
pkgrel=1
pkgdesc="HEIF file format decoder and encoder"
arch=(x86_64)
url="https://github.com/strukturag/libheif"
license=(GPL3)
makedepends=(libjpeg libpng gdk-pixbuf2)
depends=(libde265 x265 shared-mime-info)
optdepends=('libjpeg: for heif-convert and heif-enc' 'libpng: for heif-convert and heif-enc')
source=(https://github.com/strukturag/libheif/releases/download/v$pkgver/libheif-$pkgver.tar.gz)
sha256sums=('a22611289464da08fa7e580c95ea5e1b1b522b96ee6807de9b3b4605efb621d1')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-static=no
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
