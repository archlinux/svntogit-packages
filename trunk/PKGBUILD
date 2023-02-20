# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell
pkgver=43.3
pkgrel=2
epoch=1
pkgdesc="Next generation desktop shell"
url="https://wiki.gnome.org/Projects/GnomeShell"
arch=(x86_64)
license=(GPL)
depends=(
  accountsservice
  gcr-4
  gjs
  gnome-autoar
  gnome-session
  gnome-settings-daemon
  gsettings-desktop-schemas
  gtk4
  libcanberra-pulse
  libgdm
  libgweather-4
  libibus
  libnma
  libsecret
  libsoup3
  mutter
  unzip
  upower
)
makedepends=(
  asciidoc
  bash-completion
  evolution-data-server
  git
  gnome-control-center
  gobject-introspection
  gtk-doc
  meson
  sassc
)
checkdepends=(xorg-server-xvfb)
optdepends=(
  'evolution-data-server: Evolution calendar integration'
  'gnome-bluetooth-3.0: Bluetooth support'
  'gnome-control-center: System settings'
  'gnome-disk-utility: Mount with keyfiles'
  'gst-plugin-pipewire: Screen recording'
  'gst-plugins-good: Screen recording'
  'power-profiles-daemon: Power profile switching'
  'switcheroo-control: Multi-GPU support'
)
groups=(gnome)
_commit=85f141fabd427fea597dfd87f9a2dedcf8695809  # tags/43.3^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
  0001-main-Leak-the-GJS-context-and-ShellGlobal.patch
)
b2sums=('SKIP'
        'SKIP'
        '5636fd813bc0aeafbdd52eb6335ef79b5801b800e332119b3d127a6cd188aa24051ebc718449f22bea7bedc37347ff98c7d491b35d84f573f0e4cff2046117d4')

pkgver() {
  cd gnome-shell
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd gnome-shell

  # https://bugs.archlinux.org/task/77572
  # https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/2611
  git cherry-pick -n a9e6e44ef898671229388938cc3ed511fa394dfc

  # https://bugs.archlinux.org/task/74434
  # https://gitlab.gnome.org/GNOME/gnome-shell/-/merge_requests/2621
  git cherry-pick -n 266a19f05cad26d97c659493cd34ba196ef6eeb2

  # https://bugs.archlinux.org/task/71250
  # https://gitlab.gnome.org/GNOME/gnome-shell/-/issues/5560#note_1636124
  git apply -3 ../0001-main-Leak-the-GJS-context-and-ShellGlobal.patch

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
