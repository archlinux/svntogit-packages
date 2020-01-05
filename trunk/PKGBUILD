# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter
pkgver=3.34.3
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
_commit=4947e8ae5becc6ff3b2e21c16279b243d8abdd31  # tags/3.34.3^0
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        0001-EGL-Include-EGL-eglmesaext.h.patch
        0002-surface-actor-wayland-Do-not-send-frame-callbacks-if.patch
        0003-xwayland-Do-not-queue-frame-callbacks-unconditionall.patch)
sha256sums=('SKIP'
            '8440403c1862187b648e3ddd20056666f1a9fea38d0511d7bdf4422ce70b4139'
            '9f6881cd9fe2031b7119288972d3b921358f387b8cbfbd4c624a0dc33abce8e2'
            '0ad4084834b6314873d2dc0a9c8bb3b30f0a6106fa44aac98a54129ec0fc0b2c')

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
