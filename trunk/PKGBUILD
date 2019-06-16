# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=gobject-introspection
pkgname=(gobject-introspection gobject-introspection-runtime)
pkgver=1.60.2
pkgrel=1
pkgdesc="Introspection system for GObject-based libraries"
url="https://wiki.gnome.org/Projects/GObjectIntrospection"
arch=(x86_64)
license=(LGPL GPL)
depends=(python-mako python-markdown)
makedepends=(cairo git gtk-doc python-sphinx meson)
options=(!emptydirs)
_commit=41edb870614e12947db8e35af9846b19f1b8d71a  # tags/1.60.2^0
source=("git+https://gitlab.gnome.org/GNOME/gobject-introspection.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/glib.git#tag=2.60.4")
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd $pkgbase
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgbase
}
  
build() {
  arch-meson $pkgbase build \
    -D cairo=true \
    -D gtk_doc=true \
    -D doctool=true \
    -D glib_src_dir="$srcdir/glib"
  ninja -C build
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

  mv "$srcdir/runtime" "$pkgdir/usr"
}
