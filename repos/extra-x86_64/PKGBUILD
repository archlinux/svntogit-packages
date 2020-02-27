# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=libfprint
pkgver=1.90.1
pkgrel=1
pkgdesc="Library for fingerprint readers"
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/fprint/libfprint"
license=(LGPL)
depends=(libgusb pixman nss systemd-libs)
makedepends=(git meson gtk-doc gobject-introspection)
checkdepends=(cairo)
provides=(libfprint-2.so)
groups=(fprint)
_commit=66c9e4a829a06a25d8b6160cdfbad1d47ef5b81a  # tags/v1.90.1^0
source=("git+https://gitlab.freedesktop.org/libfprint/libfprint.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/^V_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
