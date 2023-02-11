# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=vte3
pkgname=(vte-common vte3 vte4 vte-docs)
pkgver=0.70.3
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget"
url="https://wiki.gnome.org/Apps/Terminal/VTE"
arch=(x86_64)
license=(LGPL)
makedepends=(
  fribidi
  gi-docgen
  git
  gnutls
  gobject-introspection
  gperf
  gtk3
  gtk4
  meson
  pcre2
  systemd
  vala
)
options=(!lto)
_commit=177c96f2b7e58ba90a7b5738089e8a97094c84d5  # tags/0.70.3^0
source=("git+https://gitlab.gnome.org/GNOME/vte.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd vte
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd vte
}

build() {
  local meson_options=(
    -D b_lto=false
    -D docs=true
    -D gtk4=true
  )

  arch-meson vte build "${meson_options[@]}"
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

package_vte-common() {
  pkgdesc+=" (common files)"
  depends=(sh)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick gtk3 usr/bin/vte-2.91
  _pick gtk3 usr/include/vte-2.91
  _pick gtk3 usr/lib/libvte-2.91.so*
  _pick gtk3 usr/lib/pkgconfig/vte-2.91.pc
  _pick gtk3 usr/lib/girepository-1.0/Vte-2.91.typelib
  _pick gtk3 usr/share/gir-1.0/Vte-2.91.gir
  _pick gtk3 usr/share/glade
  _pick gtk3 usr/share/vala/vapi/vte-2.91.{deps,vapi}

  _pick gtk4 usr/bin/vte-2.91-gtk4
  _pick gtk4 usr/include/vte-2.91-gtk4
  _pick gtk4 usr/lib/libvte-2.91-gtk4.so*
  _pick gtk4 usr/lib/pkgconfig/vte-2.91-gtk4.pc
  _pick gtk4 usr/lib/girepository-1.0/Vte-3.91.typelib
  _pick gtk4 usr/share/gir-1.0/Vte-3.91.gir
  _pick gtk4 usr/share/vala/vapi/vte-2.91-gtk4.{deps,vapi}

  _pick docs usr/share/doc
}


package_vte3() {
  pkgdesc+=" (GTK3)"
  depends=(
    fribidi
    gnutls
    gtk3
    pcre2
    systemd
    vte-common
  )
  provides+=(libvte-2.91.so)

  mv gtk3/* "$pkgdir"
}

package_vte4() {
  pkgdesc+=" (GTK4)"
  depends=(
    fribidi
    gnutls
    gtk4
    pcre2
    systemd
    vte-common
  )
  provides+=(libvte-2.91-gtk4.so)

  mv gtk4/* "$pkgdir"
}

package_vte-docs() {
  pkgdesc+=" (documentation)"

  mv docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
