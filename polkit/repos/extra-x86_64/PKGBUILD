# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=polkit
pkgver=0.120
pkgrel=3
pkgdesc="Application development toolkit for controlling system-wide privileges"
arch=(x86_64)
license=(LGPL)
url="https://www.freedesktop.org/wiki/Software/polkit/"
depends=(glib2 pam expat systemd js78)
makedepends=(meson gtk-doc gobject-introspection git)
checkdepends=(python-dbusmock)
backup=(etc/pam.d/polkit-1)
_commit=92b910ce2273daf6a76038f6bd764fa6958d4e8e  # tags/0.120
source=("git+https://gitlab.freedesktop.org/polkit/polkit.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd polkit
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson polkit build \
    -D session_tracking=libsystemd-login \
    -D os_type=redhat \
    -D examples=true \
    -D tests=true \
    -D gtk_doc=true \
    -D man=true
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

# vim:set sw=2 et:
