# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgbase=tracker3
pkgname=(tracker3 tracker3-docs)
pkgver=3.4.2
pkgrel=1
pkgdesc="Desktop-neutral user information store, search tool and indexer"
url="https://wiki.gnome.org/Projects/Tracker"
arch=(x86_64)
license=(GPL)
depends=(
  glib2
  icu
  json-glib
  libffi
  libseccomp
  libsoup3
  libstemmer
  sqlite
  util-linux
)
makedepends=(
  asciidoc
  bash-completion
  git
  gobject-introspection
  hotdoc
  libsoup
  meson
  python-dbus
  python-gobject
  python-tappy
  systemd
)
_commit=0de82e325639c567353ca68ccc421d12e5f1de86  # tags/3.4.2^0
source=("git+https://gitlab.gnome.org/GNOME/tracker.git#commit=$_commit"
        hotdoc.diff)
sha256sums=('SKIP'
            '804c682efe02e89349b4269f87bb50f97de5674f58b20bd7895569dbaafc6788')

pkgver() {
  cd tracker
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd tracker

  # Fix docs build
  git apply -3 ../hotdoc.diff
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

# vim:set sw=2 sts=-1 et:
