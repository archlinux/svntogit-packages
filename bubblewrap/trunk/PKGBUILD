# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgbase=bubblewrap
pkgname=(bubblewrap bubblewrap-suid)
pkgver=0.6.2
pkgrel=1
pkgdesc='Unprivileged sandboxing tool'
url='https://github.com/projectatomic/bubblewrap'
arch=(x86_64)
license=(GPL)
depends=(glibc libcap)
makedepends=(libxslt docbook-xsl git meson bash-completion)
options=(debug)
_commit=c54bbc6d7b78e7a45016efe0c4ac8af9d209aa20  # tags/v0.6.2^0
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
