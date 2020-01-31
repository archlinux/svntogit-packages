# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Adam Fontenot <fontenot@ucla.edu>

pkgname=libheif
pkgver=1.6.2
pkgrel=1
pkgdesc="HEIF file format decoder and encoder"
arch=(x86_64)
url="https://github.com/strukturag/libheif"
license=(GPL3)
makedepends=(libjpeg libpng gdk-pixbuf2)
depends=(libde265 x265 shared-mime-info)
optdepends=('libjpeg: for heif-convert and heif-enc' 'libpng: for heif-convert and heif-enc')
source=(https://github.com/strukturag/libheif/releases/download/v$pkgver/libheif-$pkgver.tar.gz)
sha256sums=('bb229e855621deb374f61bee95c4642f60c2a2496bded35df3d3c42cc6d8eefc')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --enable-static=no
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
