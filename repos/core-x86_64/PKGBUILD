# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=libxcrypt
# Neither tarballs nor tags are signed, but commits are.
_commit='94d84f92ca123d851586016c4678eb1f21c19029' # git rev-parse v${pkgver}
pkgver=4.4.18
pkgrel=1
pkgdesc='Modern library for one-way hashing of passwords'
arch=('x86_64')
url='https://github.com/besser82/libxcrypt/'
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('libcrypt.so')
validpgpkeys=('678CE3FEE430311596DB8C16F52E98007594C21D') # Björn 'besser82' Esser
source=("git+https://github.com/besser82/libxcrypt.git#commit=${_commit}?signed")
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  autoreconf -fi
}

build() {
  cd $pkgname
  ./configure \
    --prefix=/usr \
    --disable-static \
    --enable-hashes=strong,glibc \
    --enable-obsolete-api=no \
    --disable-failure-tokens
  make
}

check() {
  cd $pkgname
  make check 
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
