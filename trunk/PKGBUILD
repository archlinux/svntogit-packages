# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell
pkgver=43.1
pkgrel=2
epoch=1
pkgdesc="Next generation desktop shell"
url="https://wiki.gnome.org/Projects/GnomeShell"
arch=(x86_64)
license=(GPL)
depends=(accountsservice gcr-4 gjs upower gnome-session gtk4
         gnome-settings-daemon gsettings-desktop-schemas libcanberra-pulse
         libgdm libsecret mutter libnma unzip libibus gnome-autoar
         gnome-disk-utility libsoup3 libgweather-4)
makedepends=(gtk-doc gnome-control-center evolution-data-server
             gobject-introspection git meson sassc asciidoc bash-completion)
checkdepends=(xorg-server-xvfb)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration'
            'gst-plugins-good: Screen recording'
            'gst-plugin-pipewire: Screen recording'
            'gnome-bluetooth-3.0: Bluetooth support'
            'power-profiles-daemon: Power profile switching')
groups=(gnome)
options=(debug)
_commit=8b00255cc31814b09a35c9be38228d873676233e  # tags/43.1^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd gnome-shell
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gnome-shell

  # More fixes to screencast support detection
  git cherry-pick -n a2acecb491e53e889dd995d3db386aaa182e04a0 \
                     144daf200c12f313c2cc7c01daef9e26e396a328

  git submodule init
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git -c protocol.file.allow=always submodule update
}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson gnome-shell build -D gtk_doc=true
  meson compile -C build
}

_check() (
  export XDG_RUNTIME_DIR="$PWD/runtime-dir"
  mkdir -p -m 700 "$XDG_RUNTIME_DIR"

  meson test -C build --print-errorlogs
)

check() {
  dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
    bash -c "$(declare -f _check); _check"
}

package() {
  depends+=(libmutter-11.so)
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
