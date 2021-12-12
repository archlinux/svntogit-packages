# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell
pkgver=41.2
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell"
url="https://wiki.gnome.org/Projects/GnomeShell"
arch=(x86_64)
license=(GPL)
depends=(accountsservice gcr gjs gnome-bluetooth upower gnome-session gtk4
         gnome-settings-daemon gnome-themes-extra gsettings-desktop-schemas
         libcanberra-pulse libgdm libsecret mutter nm-connection-editor unzip
         gstreamer libibus gnome-autoar gnome-disk-utility gst-plugin-pipewire
         libsoup3)
makedepends=(gtk-doc gnome-control-center evolution-data-server
             gobject-introspection git meson sassc asciidoc bash-completion)
checkdepends=(xorg-server-xvfb)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
groups=(gnome)
_commit=618965fcd4a16255235dc6e27a88fe29118afd22  # tags/41.2^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname

  git submodule init
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git submodule update
}

build() {
  arch-meson $pkgname build -D gtk_doc=true
  meson compile -C build
}

check() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  export XDG_RUNTIME_DIR

  dbus-run-session xvfb-run -s '-nolisten local' \
    meson test -C build --print-errorlogs
)

package() {
  depends+=(libmutter-9.so)
  meson install -C build --destdir "$pkgdir"
}
