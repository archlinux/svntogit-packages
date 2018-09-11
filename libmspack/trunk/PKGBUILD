# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: AndyRTR <andyrtr@archlinux.org>

pkgname=libmspack
pkgver=0.7.1alpha
pkgrel=1
epoch=1
pkgdesc="A library for Microsoft compression formats"
url="https://www.cabextract.org.uk/libmspack/"
arch=(x86_64)
license=(GPL)
depends=(glibc)
makedepends=(git)
_commit=846db1c3419eca65f8d09b5452063870a65ed9f0  # tags/v0.7.1alpha^0
source=("git+https://github.com/kyz/libmspack#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare(){
  cd $pkgname/$pkgname
  autoreconf -vfi
}

build() {
  cd $pkgname/$pkgname
  ./configure --prefix=/usr --disable-static
  make
}

check() {
  cd $pkgname/$pkgname
  make check
}

package() {
  cd $pkgname/$pkgname
  make DESTDIR="$pkgdir" install
}
