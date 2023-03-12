# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=glib2
pkgname=(glib2 glib2-docs)
pkgver=2.76.0
pkgrel=1
pkgdesc="Low level core library"
url="https://wiki.gnome.org/Projects/GLib"
license=(LGPL)
arch=(x86_64)
depends=(
  libffi
  libsysprof-capture
  pcre2
  util-linux-libs
  zlib
)
makedepends=(
  dbus
  gettext
  git
  gtk-doc
  libelf
  meson
  python
  shared-mime-info
  util-linux
)
checkdepends=(
  desktop-file-utils
  glib2
)
options=(
  debug
  staticlibs
)
_commit=8a9ada663923e39c0e8d7eefe65390955dc3c0d8  # tags/2.76.0^0
source=(
  "git+https://gitlab.gnome.org/GNOME/glib.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/gvdb.git"
  0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch
  gio-querymodules.{hook,script}
  glib-compile-schemas.hook
)
b2sums=('SKIP'
        'SKIP'
        'bd7f881ae6054c363783bf45b1add5eef5e8347554e23b9fece526701469d07cdcb9871fa73dee473796a219e8aa513796a96da769949097ea207db038578d07'
        'cd3a7817193ca985be5aff0813e78cc59c39ad8d4a2171c1c719267e4f51beda47c58a44c6d5afead64e9fa1b854430ac935976d02158e927ba3ec8f36fce282'
        '4b90eb8d582509b09aab401313d4399cc139ad21b5dd7d45d79860d0764c7494c60714e0794e09823e51d1894ac032a994f27d79d1499abf24ee6f59bdb0c243'
        'd30d349b4cb4407839d9074ce08f5259b8a5f3ca46769aabc621f17d15effdb89c4bf19bd23603f6df3d59f8d1adaded0f4bacd0333afcab782f2d048c882858')


pkgver() {
  cd glib
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd glib

  # Suppress noise from glib-compile-schemas.hook
  git apply -3 ../0001-glib-compile-schemas-Remove-noisy-deprecation-warnin.patch

  git submodule init
  git submodule set-url subprojects/gvdb "$srcdir/gvdb"
  git -c protocol.file.allow=always submodule update
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
  depends+=(
    libffi.so
    libmount.so
  )
  provides+=(libg{lib,io,module,object,thread}-2.0.so)
  optdepends=(
    'gvfs: most gio functionality'
    'libelf: gresource inspection tool'
    'python: gdbus-codegen, glib-genmarshal, glib-mkenums, gtester-report'
  )

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

# vim:set sw=2 sts=-1 et:
