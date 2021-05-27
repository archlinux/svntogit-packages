# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: damir <damir@archlinux.org>

pkgbase=libxml++2.6
pkgname=(libxml++2.6 libxml++2.6-docs)
pkgver=2.42.1
pkgrel=1
pkgdesc="C++ bindings to libxml2"
url="https://libxmlplusplus.github.io/libxmlplusplus/"
arch=(x86_64)
license=(LGPL)
depends=(libxml2 glibmm)
makedepends=(git meson mm-common glibmm-docs)
options=(!emptydirs)
_commit=ceedcb1ca7462305cbca16464bbc5ea50d89c356  # tags/2.42.1^0
source=("git+https://github.com/libxmlplusplus/libxmlplusplus#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd libxmlplusplus
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libxmlplusplus
}

build() {
  arch-meson libxmlplusplus build -D maintainer-mode=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_libxml++2.6() {
  provides=("libxml++2=$pkgver" libxml++-2.6.so)
  conflicts=(libxml++2)
  replaces=(libxml++2)

  meson install -C build --destdir "$pkgdir"

  # Split -docs
  mkdir -p docs/usr/share
  mv -t docs/usr/share "$pkgdir"/usr/share/{devhelp,doc}
}

package_libxml++2.6-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  options=(!strip)

  mv -t "$pkgdir" docs/*
}
