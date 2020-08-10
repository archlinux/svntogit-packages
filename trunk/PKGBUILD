# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=libxcrypt
pkgver=4.4.16
pkgrel=2
pkgdesc='Modern library for one-way hashing of passwords'
arch=(x86_64)
url='https://github.com/besser82/libxcrypt/'
license=(GPL)
depends=(glibc)
provides=(libcrypt.so)
source=($pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz)
sha256sums=('a98f65b8baffa2b5ba68ee53c10c0a328166ef4116bce3baece190c8ce01f375')

prepare() {
  cd $pkgname-$pkgver
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --disable-static \
    --enable-hashes=strong \
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
  rm -f "$pkgdir/usr/lib/libcrypt.so"
}
