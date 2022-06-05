# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=libmp4v2
pkgver=2.1.1
pkgrel=1
epoch=1
pkgdesc="A C/C++ library to create, modify and read MP4 files"
arch=('x86_64')
license=('MPL')
url="https://mp4v2.org/"
depends=('gcc-libs')
source=("https://github.com/enzo1982/mp4v2/releases/download/v$pkgver/mp4v2-$pkgver.tar.bz2")
sha512sums=('887e31baf6db191420c88dc7ee619738110457352430545b36a2c80ba603eaa24f701a45796a66b0502ef3a58bcf58f5b96e3e6d160303b402f0b4fb1bdefd98')

build() {
  cd mp4v2-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd mp4v2-$pkgver
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install-man
}
