# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-klotski
pkgver=3.38.2
pkgrel=1
pkgdesc="Slide blocks to solve the puzzle"
url="https://wiki.gnome.org/Apps/Klotski"
arch=(x86_64)
license=(GPL)
depends=(gtk3 librsvg libgnome-games-support)
makedepends=(meson gobject-introspection yelp-tools appstream-glib vala git)
groups=(gnome-extra)
_commit=32d1c953fa49a6b0281b00ea449020027f3f2659  # tags/3.38.2^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-klotski.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
