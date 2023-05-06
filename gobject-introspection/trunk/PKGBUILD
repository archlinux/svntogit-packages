# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gobject-introspection
pkgname=(
  gobject-introspection
  gobject-introspection-runtime
  libgirepository
)
pkgver=1.76.1
pkgrel=3
pkgdesc="Introspection system for GObject-based libraries"
url="https://wiki.gnome.org/Projects/GObjectIntrospection"
arch=(x86_64)
license=(LGPL GPL)
_glibver=2.76.2
makedepends=(
  cairo
  git
  "glib2=$_glibver"
  gtk-doc
  meson
  python-mako
  python-markdown
  python-sphinx
)
_commit=1565805460c3fd65f8630debd0337ec0e33ee2e7  # tags/1.76.1^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gobject-introspection.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/glib.git?signed#tag=$_glibver"
)
b2sums=('SKIP'
        'SKIP')
validpgpkeys=('923B7025EE03C1C59F42684CF0942E894B2EAFA0'  # Philip Withnall <philip@tecnocode.co.uk>
              'D4C501DA48EB797A081750939449C2F50996635F') # Marco Trevisan <marco@trevi.me>

pkgver() {
  cd $pkgbase
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgbase
}
  
build() {
  local meson_options=(
    -D glib_src_dir="$srcdir/glib"
    -D gtk_doc=true
  )

  arch-meson $pkgbase build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
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
  depends=(
    "gobject-introspection-runtime=$pkgver-$pkgrel"
    python-mako
    python-markdown
  )

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  python -m compileall -d /usr/lib/$pkgbase usr/lib/$pkgbase
  python -O -m compileall -d /usr/lib/$pkgbase usr/lib/$pkgbase

  _pick libg usr/include/gobject-introspection-1.0
  _pick libg usr/lib/libgirepository-1.0.so*
  _pick libg usr/lib/pkgconfig/gobject-introspection*-1.0.pc
  _pick libg usr/lib/girepository-1.0/GIRepository-2.0.typelib
  _pick libg usr/share/gir-1.0/GIRepository-2.0.gir
  _pick libg usr/share/gtk-doc

  _pick runtime usr/lib/girepository-1.0
}

package_gobject-introspection-runtime() {
  pkgdesc+=" - runtime"
  depends=("libgirepository=$pkgver-$pkgrel")

  mv runtime/* "$pkgdir"
}

package_libgirepository() {
  pkgdesc+=" - runtime library"
  depends=(
    libffi.so
    libg{lib,object,module,io}-2.0.so
  )
  provides=(libgirepository-1.0.so)

  mv libg/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
