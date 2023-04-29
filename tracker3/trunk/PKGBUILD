# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgbase=tracker3
pkgname=(
  tracker3
  tracker3-docs
)
pkgver=3.5.1
pkgrel=1
pkgdesc="Desktop-neutral user information store, search tool and indexer"
url="https://wiki.gnome.org/Projects/Tracker"
arch=(x86_64)
license=(GPL)
depends=(
  glib2
  icu
  json-glib
  libsoup3
  libstemmer
  libxml2
  sqlite
)
makedepends=(
  asciidoc
  bash-completion
  dbus
  gi-docgen
  git
  gobject-introspection
  libsoup
  meson
  python-dbus
  python-gobject
  python-tappy
  systemd
  vala
)
_commit=0619c65273da0ca2644e43596fe3d61c1d8b0737  # tags/3.5.1^0
source=(
  "git+https://gitlab.gnome.org/GNOME/tracker.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git"
)
b2sums=('SKIP'
        'SKIP')

pkgver() {
  cd tracker
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd tracker

  git submodule init
  git submodule set-url subprojects/gvdb "$srcdir/gvdb"
  git -c protocol.file.allow=always submodule update
}

build() {
  local meson_options=(
    -D tests_tap_protocol=true
  )

  arch-meson tracker build "${meson_options[@]}"
  meson compile -C build
}

check() {
  dbus-run-session meson test -C build --print-errorlogs -t 3
}

package_tracker3() {
  optdepends=('libsoup: Alternative remoting backend')
  provides=(libtracker-sparql-3.0.so)

  meson install -C build --destdir "$pkgdir"

  mkdir -p docs/usr/share
  mv {"$pkgdir",docs}/usr/share/doc
}

package_tracker3-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  mv docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
