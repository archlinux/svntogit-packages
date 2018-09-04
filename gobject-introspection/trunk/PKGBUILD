# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgbase=gobject-introspection
pkgname=(gobject-introspection gobject-introspection-runtime)
pkgver=1.58.0
pkgrel=2
pkgdesc="Introspection system for GObject-based libraries"
url="https://wiki.gnome.org/Projects/GObjectIntrospection"
arch=(x86_64)
license=(LGPL GPL)
depends=(python python-mako)
makedepends=(cairo git gtk-doc python-sphinx meson)
options=(!emptydirs)
_commit=01bf21f398d5ece9ac2d78c00b4b362091f8e05c  # tags/1.58.0^0
source=("git+https://gitlab.gnome.org/GNOME/gobject-introspection.git#commit=$_commit"
        warnlib.diff)
sha512sums=('SKIP'
            'f9cf08b83a6f220923f7b5666638877a152ab90bebb6703e5026badc9852a69131b9c17e1d4dda89f9f5b6d8fb58a17780bd87d9c3bf66f5b8a9260f4f6debf4')

pkgver() {
  cd $pkgbase
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgbase
  # GJS needs warnlib to build
  patch -Np1 -i ../warnlib.diff
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
  python -m compileall "$pkgdir/usr/lib/gobject-introspection"
  python -O -m compileall "$pkgdir/usr/lib/gobject-introspection"

### Split runtime
  mkdir -p "$srcdir/runtime/lib"
  mv "$pkgdir"/usr/lib/{lib*,girepository-*} "$srcdir/runtime/lib"
}

package_gobject-introspection-runtime() {
  pkgdesc+=" (runtime library)"
  depends=(glib2)

  mv "$srcdir/runtime" "$pkgdir/usr"
}
