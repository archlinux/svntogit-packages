# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gobject-introspection
pkgname=(gobject-introspection gobject-introspection-runtime)
pkgver=1.72.0
pkgrel=1
pkgdesc="Introspection system for GObject-based libraries"
url="https://wiki.gnome.org/Projects/GObjectIntrospection"
arch=(x86_64)
license=(LGPL GPL)
_glibver=2.72.0
depends=(python-mako python-markdown)
makedepends=(cairo git gtk-doc python-sphinx meson "glib2=$_glibver")
options=(debug)
_commit=c1ce7d179cfce327162bd206cdf2808bd9bd0cc7  # tags/1.72.0^0
source=("git+https://gitlab.gnome.org/GNOME/gobject-introspection.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/glib.git?signed#tag=$_glibver")
sha512sums=('SKIP'
            'SKIP')
validpgpkeys=('923B7025EE03C1C59F42684CF0942E894B2EAFA0') # Philip Withnall <philip@tecnocode.co.uk>

pkgver() {
  cd $pkgbase
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgbase
}
  
build() {
  arch-meson $pkgbase build \
    -D gtk_doc=true \
    -D glib_src_dir="$srcdir/glib"
  meson compile -C build
}

check() {
  meson test -C build
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

package_gobject-introspection() {
  depends+=("gobject-introspection-runtime=$pkgver-$pkgrel")

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  python -m compileall -d /usr/lib/$pkgbase usr/lib/$pkgbase
  python -O -m compileall -d /usr/lib/$pkgbase usr/lib/$pkgbase

  _pick runtime usr/lib/lib*
  _pick runtime usr/lib/girepository-*
}

package_gobject-introspection-runtime() {
  pkgdesc+=" (runtime library)"
  depends=(glib2)
  provides+=(libgirepository-1.0.so)

  mv runtime/* "$pkgdir"
}
