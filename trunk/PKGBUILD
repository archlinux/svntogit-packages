# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Nikolay Rysev <mad.f3ka@gmail.com>

pkgname=fprintd
pkgver=1.90.9
pkgrel=1
pkgdesc="D-Bus service to access fingerprint readers"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(GPL)
depends=(glib2 libfprint polkit dbus dbus-glib libsystemd)
makedepends=(gtk-doc git meson pam_wrapper python-cairo python-dbus
             python-dbusmock)
groups=(fprint)
_commit=da60bddb3e5be024c6c1958437cb13e0ce0ffac8  # tags/v1.90.9^0
source=("git+https://gitlab.freedesktop.org/libfprint/fprintd.git#commit=$_commit"
        0001-data-Use-the-correct-mode-for-the-state-dir.patch)
sha256sums=('SKIP'
            'da1fa15963d004db79176f9795f1b42899d6295380c4275e420627eff02d7db1')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/^V_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname

  # https://gitlab.freedesktop.org/libfprint/fprintd/-/merge_requests/119
  # https://bugs.archlinux.org/task/68932
  git apply -3 ../0001-data-Use-the-correct-mode-for-the-state-dir.patch
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
}
