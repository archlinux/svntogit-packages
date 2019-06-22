# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=bubblewrap
pkgver=0.3.3
pkgrel=2
pkgdesc='Unprivileged sandboxing tool'
url='https://github.com/projectatomic/bubblewrap'
arch=(x86_64)
license=(GPL)
depends=(glibc libcap)
makedepends=(libxslt docbook-xsl git)
_commit=bc13e228d172cc2385aa445b512c6bf8ca2f3376  # tags/v0.3.3^0
source=(git+$url#commit=$_commit)
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe | sed 's/^v//'
}

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr \
    --with-priv-mode=none
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
