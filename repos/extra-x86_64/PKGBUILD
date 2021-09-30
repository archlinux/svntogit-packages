# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell
pkgver=40.5
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell"
url="https://wiki.gnome.org/Projects/GnomeShell"
arch=(x86_64)
license=(GPL)
depends=(accountsservice gcr gjs gnome-bluetooth upower gnome-session gtk4
         gnome-settings-daemon gnome-themes-extra gsettings-desktop-schemas
         libcanberra-pulse libgdm libsecret mutter nm-connection-editor unzip
         gstreamer libibus gnome-autoar gnome-disk-utility gst-plugin-pipewire)
makedepends=(gtk-doc gnome-control-center evolution-data-server
             gobject-introspection git meson sassc asciidoc bash-completion)
checkdepends=(xorg-server-xvfb)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
groups=(gnome)
_commit=ad6f45f403fce7922392c43f30059c4af2aac561  # tags/40.5^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
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

  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local +iglx -noreset' \
  meson test -C build --print-errorlogs
)

package() {
  depends+=(libmutter-8.so)
  meson install -C build --destdir "$pkgdir"
}
