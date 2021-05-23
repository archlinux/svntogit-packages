# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=libndp
pkgver=1.8
pkgrel=1
pkgdesc="Library for Neighbor Discovery Protocol"
arch=(x86_64)
url="http://libndp.org/"
license=(LGPL)
depends=(glibc)
makedepends=(git)
_commit=009ce9cd9b950ffa1f4f94c9436027b936850d0c  # tags/v1.8
source=("git+https://github.com/jpirko/libndp#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --libexecdir=/usr/lib
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
