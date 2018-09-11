# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=libfprint
pkgver=0.8.2
pkgrel=1
pkgdesc="Library for fingerprint readers"
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/fprint/libfprint"
license=(LGPL)
depends=(libusb nss pixman glib2)
makedepends=(git meson gtk-doc)
groups=(fprint)
_commit=da95af0f48a247300457ecfe6be59e8284ce9df3  # tags/V_0_8_2^0
source=("git+https://gitlab.freedesktop.org/libfprint/libfprint.git#commit=$_commit"
        fix.diff)
sha256sums=('SKIP'
            'bc76b1cf42aeaee8e21ff24c40c44744b9ee2d601399b3c43dba7334ca20ce62')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^V_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
  # https://github.com/mesonbuild/meson/issues/3892
  patch -Np1 -i ../fix.diff
}

build() {
  arch-meson $pkgname build -D x11-examples=false
  ninja -C build
}

check() {
  cd build
  meson test
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
