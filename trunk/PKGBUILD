# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgbase=tracker3
pkgname=(tracker3 tracker3-docs)
pkgver=3.3.0
pkgrel=2
pkgdesc="Desktop-neutral user information store, search tool and indexer"
url="https://wiki.gnome.org/Projects/Tracker"
arch=(x86_64)
license=(GPL)
depends=(sqlite icu glib2 libffi util-linux libstemmer libseccomp json-glib
         libsoup3)
makedepends=(gobject-introspection vala git hotdoc bash-completion meson
             asciidoc systemd libsoup python-gobject python-dbus python-tappy)
options=(debug)
_commit=f56ecdc3921a537881d5aa8991d32e9d9c54a2d9  # tags/3.3.0^0
source=("git+https://gitlab.gnome.org/GNOME/tracker.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd tracker
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd tracker
}

build() {
  arch-meson tracker build -D tests_tap_protocol=true
  meson compile -C build
}

check() {
  dbus-run-session meson test -C build --print-errorlogs -t 3
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_tracker3() {
  optdepends=('libsoup: Alternative remoting backend')
  provides=(libtracker-sparql-3.0.so)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"
  _pick docs usr/share/{devhelp,doc}
}

package_tracker3-docs() {
  pkgdesc+=" (documentation)"
  depends=()
  mv docs/* "$pkgdir"
}

# vim:set sw=2 et:
