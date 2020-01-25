# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter
pkgver=3.34.3+14+g59e9b073a
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
_commit=59e9b073a5bf7bb7eb332b680c573a27bd019249  # gnome-3-34
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        0001-EGL-Include-EGL-eglmesaext.h.patch
        0002-surface-actor-wayland-Do-not-send-frame-callbacks-if.patch
        0003-xwayland-Do-not-queue-frame-callbacks-unconditionall.patch
        0004-background-Scale-monitor_area-after-texture-creation.patch)
sha256sums=('SKIP'
            '6e23ce636916f7d33d05916910cbc97dbe20ca1e8f110cf3f65c95dd5c14962b'
            'efdd77f91e087f85e6926127a4cc3a7132d4bc75ceb57e239869cbe06a1c67f6'
            '791090835994c992cfdb0e65f70d2e8983191eda8c4c8f096819f23d916ca1a6'
            '737dc54c7103a1830a4c4e3cfec44864dc6bce04517511ed796bc9aaaf3958b9')

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
  dbus-run-session xvfb-run -s '+iglx -noreset' meson test -C build --print-errorlogs || :
)

package() {
  DESTDIR="$pkgdir" meson install -C build
}
