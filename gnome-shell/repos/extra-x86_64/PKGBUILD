# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgname=gnome-shell
pkgver=3.32.2+11+g1c6abf378
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell"
url="https://wiki.gnome.org/Projects/GnomeShell"
arch=(x86_64)
license=(GPL2)
depends=(accountsservice gcr gjs gnome-bluetooth upower gnome-session gnome-settings-daemon
         gnome-themes-extra gsettings-desktop-schemas libcanberra-pulse libcroco libgdm libsecret
         mutter nm-connection-editor unzip gstreamer libibus)
makedepends=(gtk-doc gnome-control-center evolution-data-server gobject-introspection git meson
             sassc)
optdepends=('gnome-control-center: System settings'
            'evolution-data-server: Evolution calendar integration')
groups=(gnome)
install=gnome-shell.install
_commit=1c6abf37855cd4f834569b6db32d32c1d8876f2a  # gnome-3-32
source=("git+https://gitlab.gnome.org/GNOME/gnome-shell.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
        0001-tweener-Remove-handlers-on-target.patch
        0001-js-ui-Use-captured-event-nonmotion.patch)
sha256sums=('SKIP'
            'SKIP'
            '241bea1273982bc97a58d0e25d610c6cbbc3e3be72a203015826dc599b3303c0'
            '27b0e188bc25e59a4907e326bf890ac3e5164c660cf67366394d91000d5cee0c')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname

  # fix gjs errors
  git apply -3 ../0001-tweener-Remove-handlers-on-target.patch   # !4
  git cherry-pick -n aec015d5ca14c7e28355f3ef9520b0f01280a51f    # !190
  git cherry-pick -n 2ef883dcada125bd8d5e54d7020c26cc3ec7e4f7    # !190

  # reduce overhead moving cursor or windows
  git apply -3 ../0001-js-ui-Use-captured-event-nonmotion.patch  # !276

  git submodule init
  git config --local submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
  git submodule update
}
  
build() {
  arch-meson $pkgname build -D gtk_doc=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  # https://bugs.archlinux.org/task/37412
  mkdir "$pkgdir/usr/share/gnome-shell/modes"
}
