# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>

pkgbase=vte3
pkgname=(vte3 vte-common)
pkgver=0.58.3
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget for use with GTK3"
url="https://wiki.gnome.org/Apps/Terminal/VTE"
arch=(x86_64)
license=(LGPL)
options=(!emptydirs)
depends=(gtk3 pcre2 gnutls fribidi)
makedepends=(gobject-introspection vala git gtk-doc gperf meson)
_commit=73f9e209f70050ea88ed3d80e819ea1a04c5a6e1  # tags/0.58.3^0
source=("git+https://gitlab.gnome.org/GNOME/vte.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd vte
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd vte
}

build() {
  arch-meson vte build -D docs=true
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package_vte3(){
  depends+=(vte-common)

  DESTDIR="$pkgdir" meson install -C build

  mv "$pkgdir/etc/profile.d/vte.sh" "$srcdir"
}

package_vte-common() {
  pkgdesc="Common files used by vte and vte3"
  depends=(sh)

  install -Dt "$pkgdir/etc/profile.d" -m644 vte.sh
}

# vim:set sw=2 et:
