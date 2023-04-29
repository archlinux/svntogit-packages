# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-terminal
pkgver=3.48.1
pkgrel=1
pkgdesc="The GNOME Terminal Emulator"
url="https://wiki.gnome.org/Apps/Terminal"
arch=(x86_64)
license=(GPL)
depends=(
  gsettings-desktop-schemas
  vte3
)
makedepends=(
  docbook-xsl
  git
  gnome-shell
  libnautilus-extension
  meson
  yelp-tools
)
groups=(gnome-extra)
_commit=1446ff0abc478bdd03c6665b718214d075729024  # tags/3.48.1^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-terminal.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  local meson_options=(
    -D b_lto=false
  )

  arch-meson $pkgname build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
