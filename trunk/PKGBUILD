# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-robots
pkgver=40.0
pkgrel=1
pkgdesc="Avoid the robots and make them crash into each other"
url="https://wiki.gnome.org/Apps/Robots"
arch=(x86_64)
license=(GPL)
depends=(gtk3 gsound librsvg libgnome-games-support libgee)
makedepends=(meson gobject-introspection yelp-tools appstream-glib git vala)
groups=(gnome-extra)
_commit=6c9525c31e4ee08f2cb4e21d9d9de41850084fb4  # tags/40.0^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-robots.git#commit=$_commit")
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
