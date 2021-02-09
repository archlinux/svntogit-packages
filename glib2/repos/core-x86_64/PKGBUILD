# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=glib2
pkgname=(glib2 glib2-docs)
pkgver=2.66.6
pkgrel=2
pkgdesc="Low level core library"
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL)
arch=(x86_64)
depends=(pcre libffi util-linux-libs zlib)
makedepends=(gettext gtk-doc shared-mime-info python libelf git util-linux
             meson dbus sysprof)
checkdepends=(desktop-file-utils)
_commit=d5ec4f360fb5a2ef0df1862999f970dc67fa352c  # tags/2.66.6^0
source=("git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
        0001-giochannel-Fix-length_size-bounds-check.patch
        noisy-glib-compile-schemas.diff
        glib-compile-schemas.hook gio-querymodules.{hook,script})
sha256sums=('SKIP'
            'd2dbc00679545cedb33d0179d69a9be5c12b3f00d426e227ca07687384f3407c'
            '81a4df0b638730cffb7fa263c04841f7ca6b9c9578ee5045db6f30ff0c3fc531'
            '64ae5597dda3cc160fc74be038dbe6267d41b525c0c35da9125fbf0de27f9b25'
            '2a9f9b8235f48e3b7d0f6cfcbc76cd2116c45f28692cac4bd61074c495bd5eb7'
            '92d08db5aa30bda276bc3d718e7ff9dd01dc40dcab45b359182dcc290054e24e')

pkgver() {
  cd glib
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd glib

  # https://bugs.archlinux.org/task/69569
  git apply -3 ../0001-giochannel-Fix-length_size-bounds-check.patch

  # Suppress noise from glib-compile-schemas.hook
  git apply -3 ../noisy-glib-compile-schemas.diff
}

build() {
  CFLAGS+=" -DG_DISABLE_CAST_CHECKS"
  arch-meson glib build \
    -D selinux=disabled \
    -D sysprof=enabled \
    -D man=true \
    -D gtk_doc=true
  meson compile -C build
}

check() {
  meson test -C build --no-suite flaky --no-suite slow --print-errorlogs
}

package_glib2() {
  depends+=(libmount.so)
  provides+=(libgio-2.0.so libglib-2.0.so libgmodule-2.0.so libgobject-2.0.so
             libgthread-2.0.so)
  optdepends=('python: gdbus-codegen, glib-genmarshal, glib-mkenums, gtester-report'
              'libelf: gresource inspection tool')

  DESTDIR="$pkgdir" meson install -C build

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
  install -D gio-querymodules.script "$pkgdir/usr/share/libalpm/scripts/gio-querymodules"

  # Avoid a dep on sysprof
  sed -i 's/, sysprof-capture-4//' "$pkgdir"/usr/lib/pkgconfig/*.pc

  export PYTHONHASHSEED=0
  python -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"
  python -O -m compileall -d /usr/share/glib-2.0/codegen \
    "$pkgdir/usr/share/glib-2.0/codegen"

  # Split docs
  mkdir -p docs/usr/share
  mv {"$pkgdir",docs}/usr/share/gtk-doc
}

package_glib2-docs() {
  pkgdesc="Documentation for GLib"
  depends=()
  license+=(custom)

  mv -t "$pkgdir" docs/*
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 glib/docs/reference/COPYING
}

# vim:set sw=2 et:
