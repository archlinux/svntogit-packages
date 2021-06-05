# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=libxcrypt
# Neither tarballs nor tags are signed, but commits are.
_commit='3df9620d08db207367c0c5152148665b5ce422e1' # git rev-parse v${pkgver}
pkgver=4.4.22
pkgrel=2
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
