# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=bubblewrap
pkgver=0.3.1
pkgrel=1
pkgdesc='Unprivileged sandboxing tool'
url='https://github.com/projectatomic/bubblewrap'
arch=(x86_64)
license=(GPL)
depends=(glibc libcap)
makedepends=(libxslt docbook-xsl git)
_commit=e7b517f40956a153972fd61a2c6da1140f52990b  # tags/v0.3.1^0
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
    --with-priv-mode=setuid
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
