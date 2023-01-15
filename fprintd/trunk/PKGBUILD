# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Nikolay Rysev <mad.f3ka@gmail.com>

pkgname=fprintd
pkgver=1.94.2
pkgrel=1
pkgdesc="D-Bus service to access fingerprint readers"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(GPL)
depends=(glib2 libfprint polkit dbus dbus-glib systemd)
makedepends=(gtk-doc git meson pam_wrapper python-cairo python-dbus
             python-dbusmock)
groups=(fprint)
_commit=0d2e2a6742cbec847aa756da25afd4b73d9ec53f  # tags/v1.94.2^0
source=("git+https://gitlab.freedesktop.org/libfprint/fprintd.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd fprintd
  git describe --tags | sed 's/^v//;s/^V_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd fprintd
}

build() {
  arch-meson fprintd build \
    -D pam_modules_dir=/usr/lib/security \
    -D gtk_doc=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(libfprint-2.so)

  meson install -C build --destdir "$pkgdir"
}
