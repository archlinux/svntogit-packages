# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-tetravex
pkgver=3.38.2
pkgrel=1
pkgdesc="Complete the puzzle by matching numbered tiles"
url="https://wiki.gnome.org/Apps/Tetravex"
arch=(x86_64)
license=(GPL)
depends=(gtk3)
makedepends=(meson gobject-introspection vala yelp-tools appstream-glib git)
groups=(gnome-extra)
_commit=76c564d4cd5aaaf3e2eea89d538358070b019753  # tags/3.38.2^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-tetravex.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build -D build_cli=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
