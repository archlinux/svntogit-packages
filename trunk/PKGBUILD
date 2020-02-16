# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter
pkgver=3.34.4
pkgrel=1
pkgdesc="A window manager for GNOME"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas libcanberra
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire xorg-server-xwayland)
makedepends=(gobject-introspection git egl-wayland meson xorg-server sysprof)
checkdepends=(xorg-server-xvfb)
groups=(gnome)
install=mutter.install
_commit=0bce4323c7054794a0c7ec8442335f19bba4e239  # tags/3.34.4^0
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        0001-EGL-Include-EGL-eglmesaext.h.patch
        0002-surface-actor-wayland-Do-not-send-frame-callbacks-if.patch
        0003-xwayland-Do-not-queue-frame-callbacks-unconditionall.patch
        0004-background-Scale-monitor_area-after-texture-creation.patch)
sha256sums=('SKIP'
            'fb91e659093f14fa08a0ccb61c913d4a929ab2a175179137bc118c17425a2208'
            '010d19f500e95dd45bc2420cb88b00f48f23c5496320d9ca3d4ddb5ff5b42938'
            'd797497380f1d7cc8bc691935ada3c6d48dc772daaa035d8271c5f5c097eeaf1'
            '7a8db66713c2a448c131f558ec741ebfda3c85d14b857ea0bb55a5fc7d5be480')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  # fix build with libglvnd's EGL headers
  git apply -3 ../0001-EGL-Include-EGL-eglmesaext.h.patch

  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/918
  git apply -3 ../0002-surface-actor-wayland-Do-not-send-frame-callbacks-if.patch

  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/956
  git apply -3 ../0003-xwayland-Do-not-queue-frame-callbacks-unconditionall.patch

  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/1004
  git apply -3 ../0004-background-Scale-monitor_area-after-texture-creation.patch
}

build() {
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"
  arch-meson $pkgname build \
    -D egl_device=true \
    -D wayland_eglstream=true \
    -D installed_tests=false
  ninja -C build
}

check() (
  mkdir -p -m 700 "${XDG_RUNTIME_DIR:=$PWD/runtime-dir}"
  glib-compile-schemas "${GSETTINGS_SCHEMA_DIR:=$PWD/build/data}"
  export XDG_RUNTIME_DIR GSETTINGS_SCHEMA_DIR

  # Unexpected passes in conform test
  # Stacking test flaky
  dbus-run-session xvfb-run \
    -s '-screen 0 1920x1080x24 -nolisten local +iglx -noreset' \
    meson test -C build --print-errorlogs || :
)

package() {
  DESTDIR="$pkgdir" meson install -C build
}
