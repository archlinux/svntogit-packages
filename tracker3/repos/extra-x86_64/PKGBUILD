# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=tracker3
pkgver=3.0.2
pkgrel=1
pkgdesc="Desktop-neutral user information store, search tool and indexer"
url="https://wiki.gnome.org/Projects/Tracker"
arch=(x86_64)
license=(GPL)
depends=(sqlite icu glib2 libffi util-linux libstemmer libseccomp libsoup
         json-glib)
makedepends=(gobject-introspection vala git gtk-doc bash-completion meson
             asciidoc systemd)
checkdepends=(python-gobject python-dbus)
provides=(libtracker-sparql-3.0.so)
groups=(gnome)
_commit=7324a45d8f5f2c221e9cdc96f8d28ffe32598ef0  # tags/3.0.2^0
source=("git+https://gitlab.gnome.org/GNOME/tracker.git#commit=$_commit"
        353.patch)
sha256sums=('SKIP'
            '1445d235392de75c65ab28a0e358056c8ce7df9127f6e146cb3e2a4879c09f3d')

pkgver() {
  cd tracker
  git describe --tags | sed 's/_/./g;s/-/+/g'
}

prepare() {
  cd tracker

  # https://gitlab.gnome.org/GNOME/tracker/-/merge_requests/353
  # https://bugs.archlinux.org/task/68903
  git apply -3 ../353.patch
}

build() {
  arch-meson tracker build --buildtype debug
  meson compile -C build
}

check() {
  TRACKER_DEBUG=sqlite,sql-statements dbus-run-session meson test -C build --print-errorlogs -t 3
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
