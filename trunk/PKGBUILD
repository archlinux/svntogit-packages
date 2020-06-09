# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Nikolay Rysev <mad.f3ka@gmail.com>

pkgname=fprintd
pkgver=1.90.1
pkgrel=1
pkgdesc="D-Bus service to access fingerprint readers"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(GPL)
depends=(glib2 libfprint polkit dbus dbus-glib libsystemd)
makedepends=(gtk-doc git meson pam_wrapper python-cairo python-dbus
             python-dbusmock)
groups=(fprint)
_commit=580cceb50eafa934c40845ce11693f8aaa79e51b  # tags/1.90.1^0
source=("git+https://gitlab.freedesktop.org/libfprint/fprintd.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^V_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build \
    -D pam_modules_dir=/usr/lib/security \
    -D gtk_doc=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  depends+=(libfprint-2.so)

  DESTDIR="$pkgdir" meson install -C build
  install -d -m 700 "$pkgdir/var/lib/fprint"
}
