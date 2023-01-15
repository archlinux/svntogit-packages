# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: AndyRTR <andyrtr@archlinux.org>

pkgname=libmspack
pkgver=0.10.1alpha
pkgrel=4
epoch=1
pkgdesc="A library for Microsoft compression formats"
url=https://www.cabextract.org.uk/libmspack/
arch=(x86_64)
license=(GPL)
depends=(glibc)
makedepends=(git)
provides=(libmspack.so)
_commit=ec93021025f27983027c1bc101f674cb14a85c0d  # tags/v0.10.1alpha^0
source=("git+https://github.com/kyz/libmspack#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname/$pkgname
  autoreconf -vfi
}

build() {
  cd $pkgname/$pkgname
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
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

# vim:set sw=2 sts=-1 et:
