# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=vte3
pkgname=(vte3 vte-common)
pkgver=0.66.2
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget"
url="https://wiki.gnome.org/Apps/Terminal/VTE"
arch=(x86_64)
license=(LGPL)
depends=(gtk3 pcre2 gnutls fribidi systemd)
makedepends=(gobject-introspection vala git gtk-doc gperf meson)
_commit=6a0a9fed4d54122df31c13d601b1509597a36f2b  # tags/0.66.2^0
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
  arch-meson vte build \
    -D b_lto=false \
    -D docs=true
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

package_vte3() {
  depends+=(vte-common)
  provides+=(libvte-2.91.so)

  meson install -C build --destdir "$pkgdir"

  _pick vte-common "$pkgdir"/etc/profile.d
  _pick vte-common "$pkgdir"/usr/lib/{systemd,vte-urlencode-cwd}
}

package_vte-common() {
  pkgdesc="Files shared by VTE libraries"
  depends=(sh)
  mv vte-common/* "$pkgdir"
}

# vim:set sw=2 et:
