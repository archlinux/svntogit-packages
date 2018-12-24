# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=libfprint
pkgver=0.99.0
pkgrel=1
pkgdesc="Library for fingerprint readers"
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/fprint/libfprint"
license=(LGPL)
depends=(libusb nss pixman glib2)
makedepends=(git meson gtk-doc)
groups=(fprint)
_commit=1abe213844b28fd8afc28eb072fd569f0f72d7f1  # tags/V_0_99_0^0
source=("git+https://gitlab.freedesktop.org/libfprint/libfprint.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^V_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build -D x11-examples=false -D gtk-examples=false
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
