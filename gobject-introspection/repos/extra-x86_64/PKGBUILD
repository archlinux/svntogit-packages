# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=gobject-introspection
pkgname=(gobject-introspection gobject-introspection-runtime)
pkgver=1.58.2
pkgrel=1
pkgdesc="Introspection system for GObject-based libraries"
url="https://wiki.gnome.org/Projects/GObjectIntrospection"
arch=(x86_64)
license=(LGPL GPL)
depends=(python python-mako)
makedepends=(cairo git gtk-doc python-sphinx meson)
options=(!emptydirs)
_commit=8796f5f17df75c6f9e726bf1549bb6d1508793f0  # tags/1.58.2^0
source=("git+https://gitlab.gnome.org/GNOME/gobject-introspection.git#commit=$_commit")
sha512sums=('SKIP')

pkgver() {
  cd $pkgbase
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgbase
}
  
build() {
  arch-meson $pkgbase build -D cairo=true -D gtk-doc=true
  ninja -C build
}

check() {
  meson test -C build
}

package_gobject-introspection() {
  depends+=("gobject-introspection-runtime=$pkgver-$pkgrel")

  DESTDIR="$pkgdir" meson install -C build

  python -m compileall -d /usr/lib/gobject-introspection "$pkgdir/usr/lib/gobject-introspection"
  python -O -m compileall -d /usr/lib/gobject-introspection "$pkgdir/usr/lib/gobject-introspection"

### Split runtime
  mkdir -p "$srcdir/runtime/lib"
  mv "$pkgdir"/usr/lib/{lib*,girepository-*} "$srcdir/runtime/lib"
}

package_gobject-introspection-runtime() {
  pkgdesc+=" (runtime library)"
  depends=(glib2)

  mv "$srcdir/runtime" "$pkgdir/usr"
}
