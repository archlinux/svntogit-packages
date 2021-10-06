# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=polkit
pkgver=0.120
pkgrel=2
pkgdesc="Application development toolkit for controlling system-wide privileges"
arch=(x86_64)
license=(LGPL)
url="https://www.freedesktop.org/wiki/Software/polkit/"
depends=(glib2 pam expat systemd js78)
makedepends=(meson gtk-doc gobject-introspection git)
backup=(etc/pam.d/polkit-1)
_commit=92b910ce2273daf6a76038f6bd764fa6958d4e8e
source=("git+https://gitlab.freedesktop.org/polkit/polkit.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

build() {
  meson build $pkgname \
    --prefix=/usr \
    -D session_tracking=libsystemd-login \
    -D os_type=redhat \
    -D tests=true \
    -D gtk_doc=true \
    -D man=true \
    -D examples=true
  meson compile -C build
}

check() {
  meson test -C build ||:
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

# vim: ts=2 sw=2 et:
