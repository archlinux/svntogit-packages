# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=(bubblewrap bubblewrap-suid)
pkgver=0.5.0
pkgrel=1
pkgdesc='Unprivileged sandboxing tool'
url='https://github.com/projectatomic/bubblewrap'
arch=(x86_64)
license=(GPL)
depends=(glibc libcap)
makedepends=(libxslt docbook-xsl git)
_commit=b84704bb64eac3011f84346c79651c7c1234712c  # tags/v0.5.0^0
source=(git+$url#commit=$_commit)
sha256sums=('SKIP')

pkgver() {
  cd $pkgbase
  git describe | sed 's/^v//'
}

prepare() {
  cd $pkgbase
  NOCONFIGURE=1 ./autogen.sh

  cd "$srcdir"
  cp -r ${pkgbase}{,-none}
  cp -r ${pkgbase}{,-setuid}
}

_build() {
  pushd ${pkgbase}-$1
  ./configure --prefix=/usr \
    --with-priv-mode=$1
  make
  popd
}

_install() {
  make -C "$srcdir/${pkgbase}-$1" DESTDIR="$pkgdir" install
}

build() {
  _build none
  _build setuid
}

package_bubblewrap() {
  _install none
}

package_bubblewrap-suid() {
  pkgdesc+=" (setuid variant)"
  provides=("bubblewrap=$pkgver-$pkgrel")
  conflicts=(bubblewrap)

  _install setuid
}
