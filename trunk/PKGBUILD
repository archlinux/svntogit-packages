# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Adam Fontenot <fontenot@ucla.edu>

pkgname=libheif
pkgver=1.16.1
pkgrel=1
pkgdesc='HEIF file format decoder and encoder'
arch=(x86_64)
url='https://github.com/strukturag/libheif'
license=(GPL3)
makedepends=(cmake libjpeg libpng gdk-pixbuf2 svt-av1 rav1e)
depends=(libde265 x265 aom dav1d)
optdepends=('libjpeg: for heif-convert and heif-enc' 'libpng: for heif-convert and heif-enc'
            'svt-av1: svt-av1 encoder' 'rav1e: rav1e encoder')
source=(https://github.com/strukturag/libheif/releases/download/v$pkgver/libheif-$pkgver.tar.gz)
sha256sums=('7760110c76844a4c2d77cc1efe186f1b8c55b16189f97ed258e3c006db84b8e3')

build() {
  cmake -B build -S $pkgname-$pkgver\
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DAOM_ENCODER=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
