# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=gobject-introspection
pkgname=(gobject-introspection gobject-introspection-runtime)
pkgver=1.66.1
pkgrel=3
pkgdesc="Introspection system for GObject-based libraries"
url="https://wiki.gnome.org/Projects/GObjectIntrospection"
arch=(x86_64)
license=(LGPL GPL)
depends=(python-mako python-markdown)
_glibver=2.66.2
makedepends=(cairo git gtk-doc python-sphinx meson "glib2=$_glibver")
options=(!emptydirs)
_commit=0de3f99f59290755de7b4909fe1d01c322657107  # tags/1.66.1^0
source=("git+https://gitlab.gnome.org/GNOME/gobject-introspection.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/glib.git?signed#tag=$_glibver")
sha512sums=('SKIP'
            'SKIP')
validpgpkeys=('923B7025EE03C1C59F42684CF0942E894B2EAFA0') # Philip Withnall <philip@tecnocode.co.uk>

pkgver() {
  cd $pkgbase
  git describe --tags | sed 's/-/+/g'
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

package_gobject-introspection() {
  depends+=("gobject-introspection-runtime=$pkgver-$pkgrel")

  DESTDIR="$pkgdir" meson install -C build

  python -m compileall -d /usr/lib/$pkgbase "$pkgdir/usr/lib/$pkgbase"
  python -O -m compileall -d /usr/lib/$pkgbase "$pkgdir/usr/lib/$pkgbase"

### Split runtime
  mkdir -p "$srcdir/runtime/lib"
  mv "$pkgdir"/usr/lib/{lib*,girepository-*} "$srcdir/runtime/lib"
}

package_gobject-introspection-runtime() {
  pkgdesc+=" (runtime library)"
  depends=(glib2)
  provides+=(libgirepository-1.0.so)

  mv "$srcdir/runtime" "$pkgdir/usr"
}
