# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgname=mutter
pkgver=3.30.2
pkgrel=2
pkgdesc="A window manager for GNOME"
url="https://gitlab.gnome.org/GNOME/mutter"
arch=(x86_64)
license=(GPL)
depends=(dconf gobject-introspection-runtime gsettings-desktop-schemas libcanberra
         startup-notification zenity libsm gnome-desktop upower libxkbcommon-x11
         gnome-settings-daemon libgudev libinput pipewire)
makedepends=(intltool gobject-introspection git egl-wayland)
groups=(gnome)
_commit=bcd6103c44ff74ebffd1737b8e0f3a952b83bd54  # tags/3.30.2^0
source=("git+https://gitlab.gnome.org/GNOME/mutter.git#commit=$_commit"
        216.patch 318.patch
        startup-notification.patch)
sha256sums=('SKIP'
            '1ae59343f3f5838babdfe1400962bb315d8b49189deb05bb516966b922cd26a5'
            'd4dcffa9c407e60e321670caaa44dcd6e2bfda7221d73ec4145a985c825a43b3'
            '00d5e77c94e83e1987cc443ed7c47303aa33367ce912b2f665bcd34f88890a17')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/216
  git apply -3 ../216.patch

  # https://gitlab.gnome.org/GNOME/mutter/merge_requests/318
  git apply -3 ../318.patch

  # https://bugzilla.gnome.org/show_bug.cgi?id=768531
  # https://bugs.archlinux.org/task/51940
  # As of 2018-05-08: Still needed, according to fmuellner
  git apply -3 ../startup-notification.patch

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib --disable-static \
      --disable-schemas-compile --enable-compile-warnings=minimum \
      --enable-gtk-doc --enable-egl-device --enable-remote-desktop

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' \
      -i {.,cogl,clutter}/libtool

  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
