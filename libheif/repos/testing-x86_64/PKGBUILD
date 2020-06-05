# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Adam Fontenot <fontenot@ucla.edu>

pkgname=libheif
pkgver=1.7.0
pkgrel=2
pkgdesc="HEIF file format decoder and encoder"
arch=(x86_64)
url="https://github.com/strukturag/libheif"
license=(GPL3)
makedepends=(libjpeg libpng gdk-pixbuf2)
depends=(libde265 x265 shared-mime-info)
optdepends=('libjpeg: for heif-convert and heif-enc' 'libpng: for heif-convert and heif-enc')
source=(https://github.com/strukturag/libheif/releases/download/v$pkgver/libheif-$pkgver.tar.gz)
sha256sums=('842a9ab4b8d6f0faf5a6dc5e8507321199ec44c0b1d8eb199f2de9b49e2db092')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-static=no
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
