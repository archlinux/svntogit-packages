# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter
pkgver=3.32.2+43+gb7f158811
pkgrel=1
pkgdesc="A window manager for GNOME"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas libcanberra
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire xorg-server-xwayland)
makedepends=(gobject-introspection git egl-wayland meson xorg-server)
checkdepends=(xorg-server-xvfb)
groups=(gnome)
install=mutter.install
_commit=b7f158811934d8e4d9dd0be28ad8e1746ceac46c  # gnome-3-32
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        0001-Remove-GLX-threaded-swap-wait.patch
        0001-Geometric-OpenGL-less-picking.patch)
sha256sums=('SKIP'
            '92c0dd3a1df455722c7bfb205eab7c72ee21055d64f397bea5a8332431f3fee7'
            '997cbf2e5cc0252914ea59f1c5388d176b8583e6785ba12fdc729d13971b4e3e')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  # rt-scheduler feature (needs CAP_SYS_NICE)
  git cherry-pick -n dae2c1d420ed272710ac55b7a00f6787e5c0e762  # !460

  # high-priority EGL contexts (needs CAP_SYS_NICE)
  git cherry-pick -n 3f29b47809a038b45528dfccd4089721c97965df  # !454
  git cherry-pick -n 7df86fb24646f8a19a47e54b86424048ec08e715  # !454

  # reduce lag
  git cherry-pick -n 45244852acc214a7a9d01dc96896ad0c079b437c  # !520
  git cherry-pick -n 4faeb12731b81ce617042973155cc4b5737e1133  # !281

  # reduce overhead moving cursor or windows
  git cherry-pick -n 01e20a6ba9e0cfa22e864c01b3395ba9568b061a  # !568
  git cherry-pick -n a20a0d7a4563366d2cd29c32a1b95a59121e7bf5  # !283
  git apply -3 ../0001-Remove-GLX-threaded-swap-wait.patch     # !602
  git cherry-pick -n a2507cd51a248e2ee50eb64479f47e5da2564535  # !189
  git apply -3 ../0001-Geometric-OpenGL-less-picking.patch     # !189

  # fix background corruption on nvidia
  git cherry-pick -n a5265365dd268e15a461a58000a10b122d0bccba  # !600

  # required to build gala
  git cherry-pick -n bd7704f9e17e9554ad663386ef4fce1e16a56f08  # !640
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
