# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=polkit
pkgver=121
pkgrel=1
pkgdesc="Application development toolkit for controlling system-wide privileges"
url="https://gitlab.freedesktop.org/polkit/polkit"
arch=(x86_64)
license=(LGPL)
depends=(glib2 pam expat systemd duktape)
makedepends=(meson gtk-doc gobject-introspection git)
checkdepends=(python-dbusmock)
provides=(libpolkit-{agent,gobject}-1.so)
backup=(etc/pam.d/polkit-1)
options=(debug)
_commit=827b0ddac5b1ef00a47fca4526fcf057bee5f1db  # tags/121
source=("git+https://gitlab.freedesktop.org/polkit/polkit.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd polkit
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd polkit
}

build() {
  local meson_options=(
    -D examples=true
    -D gtk_doc=true
    -D man=true
    -D os_type=redhat
    -D session_tracking=libsystemd-login
    -D tests=true
  )

  arch-meson polkit build "${meson_options[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs -t 3
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -d -o root -g 102 -m 750 "$pkgdir"/{etc,usr/share}/polkit-1/rules.d
  mv "$pkgdir"/{etc,usr/share}/polkit-1/rules.d/50-default.rules

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/$pkgname.conf" <<END
u polkitd 102 "PolicyKit daemon"
m polkitd proc
END
}

# vim:set sw=2 sts=-1 et:
