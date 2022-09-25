# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=glib2
pkgname=(glib2 glib2-docs)
pkgver=2.74.0
pkgrel=2
pkgdesc="Low level core library"
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL)
arch=(x86_64)
depends=(pcre2 libffi util-linux-libs zlib libsysprof-capture)
makedepends=(gettext gtk-doc shared-mime-info python libelf git util-linux
             meson dbus)
checkdepends=(desktop-file-utils)
options=(debug staticlibs)
_commit=30bd57ecf8aa051de9848ba5a2b140f4810401ff  # tags/2.74.0^0
source=("git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
        0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch
        glib-compile-schemas.hook gio-querymodules.{hook,script})
sha256sums=('SKIP'
            '6d51eb5856268d79eee01b97a299fa9f99db18b2abb4df56f2ed9e641a09138a'
            '64ae5597dda3cc160fc74be038dbe6267d41b525c0c35da9125fbf0de27f9b25'
            '2a9f9b8235f48e3b7d0f6cfcbc76cd2116c45f28692cac4bd61074c495bd5eb7'
            '92d08db5aa30bda276bc3d718e7ff9dd01dc40dcab45b359182dcc290054e24e')

pkgver() {
  cd glib
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd glib

  # Suppress noise from glib-compile-schemas.hook
  git apply -3 ../0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch

  # https://bugs.archlinux.org/task/75980
  # https://gitlab.gnome.org/GNOME/glib/-/merge_requests/2921
  git cherry-pick -n 'ea3f17d598d550345e94e4571130e429443e91cb'
}

build() {
  # Produce more debug info: GLib has a lot of useful macros
  # use fat LTO objects for static libraries
  CFLAGS+=' -ffat-lto-objects -g3'
  CXXFLAGS+=' -ffat-lto-objects -g3'

  CFLAGS+=" -DG_DISABLE_CAST_CHECKS"
  arch-meson glib build \
    --default-library both \
    -D glib_debug=disabled \
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
  depends+=(libmount.so libffi.so)
  provides+=(libgio-2.0.so libglib-2.0.so libgmodule-2.0.so libgobject-2.0.so
             libgthread-2.0.so)
  optdepends=('python: gdbus-codegen, glib-genmarshal, glib-mkenums, gtester-report'
              'libelf: gresource inspection tool'
              'gvfs: most gio functionality')

  meson install -C build --destdir "$pkgdir"

  install -Dt "$pkgdir/usr/share/libalpm/hooks" -m644 *.hook
  install -D gio-querymodules.script "$pkgdir/usr/share/libalpm/scripts/gio-querymodules"

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
