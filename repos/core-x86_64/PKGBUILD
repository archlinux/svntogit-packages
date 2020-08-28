# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=libxcrypt
pkgver=4.4.17
pkgrel=1
pkgdesc='Modern library for one-way hashing of passwords'
arch=(x86_64)
url='https://github.com/besser82/libxcrypt/'
license=(GPL)
depends=(glibc)
provides=(libcrypt.so)
source=($pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz)
sha256sums=('7665168d0409574a03f7b484682e68334764c29c21ca5df438955a381384ca07')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --disable-static \
    --enable-hashes=strong,glibc \
    --enable-obsolete-api=no \
    --disable-failure-tokens
  make
}

check() {
  cd $pkgname-$pkgver
  make check 
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
