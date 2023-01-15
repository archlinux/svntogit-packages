# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=libfprint
pkgver=1.94.5
pkgrel=1
pkgdesc="Library for fingerprint readers"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(LGPL)
depends=(libgusb pixman nss systemd libgudev)
makedepends=(git meson gtk-doc gobject-introspection)
checkdepends=(cairo)
provides=(libfprint-2.so)
groups=(fprint)
_commit=86961a9429d589c387da37351fd6b4ff3caf67ea  # tags/v1.94.5^0
source=("git+https://gitlab.freedesktop.org/libfprint/libfprint.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/^V_//;s/_/./g;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
