# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=four-in-a-row
pkgver=3.38.1
pkgrel=1
pkgdesc="Make lines of the same color to win"
url="https://wiki.gnome.org/Apps/Four-in-a-row"
arch=(x86_64)
license=(GPL3)
depends=(gtk3 gsound librsvg)
makedepends=(meson gobject-introspection yelp-tools appstream-glib vala git)
groups=(gnome-extra)
_commit=462f1096fc8876bb70c9ef2a615054822589320a  # tags/3.38.1^0
source=("git+https://gitlab.gnome.org/GNOME/four-in-a-row.git#commit=$_commit")
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
