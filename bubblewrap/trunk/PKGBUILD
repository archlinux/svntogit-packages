# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgbase=bubblewrap
pkgname=(bubblewrap bubblewrap-suid)
pkgver=0.8.0
pkgrel=1
pkgdesc='Unprivileged sandboxing tool'
url='https://github.com/projectatomic/bubblewrap'
arch=(x86_64)
license=(GPL)
depends=(
  glibc
  libcap
)
makedepends=(
  bash-completion
  docbook-xsl
  git
  libxslt
  meson
)
_commit=4ab175fe6d3a4053444b04d805a6d686f53455b9  # tags/v0.8.0^0
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgbase
  git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgbase
}

build() {
  arch-meson $pkgbase build -D selinux=disabled
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_bubblewrap() {
  meson install -C build --destdir "$pkgdir"
}

package_bubblewrap-suid() {
  pkgdesc+=" (setuid variant)"
  provides=("bubblewrap=$pkgver-$pkgrel")
  conflicts=(bubblewrap)

  meson install -C build --destdir "$pkgdir"
  chmod u+s "$pkgdir/usr/bin/bwrap"
}

# vim:set sw=2 sts=-1 et:
