# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexey D. <lq07829icatm at rambler.ru>

pkgbase=plasma-workspace
pkgname=(plasma-workspace plasma-wayland-session)
pkgver=5.27.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='KDE Plasma Workspace'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(knotifyconfig ksystemstats ktexteditor libqalculate kde-cli-tools appstream-qt
         xorg-xrdb xorg-xsetroot kactivitymanagerd kholidays xorg-xmessage milou prison kwin
         plasma-integration kpeople kactivities-stats kquickcharts kuserfeedback kpipewire
         accountsservice kio-extras kio-fuse qt5-tools oxygen-sounds)
makedepends=(extra-cmake-modules kdoctools gpsd baloo networkmanager-qt plasma-wayland-protocols wayland-protocols kunitconversion)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$pkgbase-$pkgver.tar.xz{,.sig} kde.pam)
sha256sums=('ed0b95b2eefd0782ea652c2c6eed262e8eb91f97ff72925bb3f7e161d1f72a17'
            'SKIP'
            '00090291204baabe9d6857d3b1419832376dd2e279087d718b64792691e86739')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S $pkgbase-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DGLIBC_LOCALE_GEN=OFF \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package_plasma-workspace() {
  optdepends=('plasma-workspace-wallpapers: additional wallpapers'
              'gpsd: GPS based geolocation' 'networkmanager-qt: IP based geolocation'
              'kdepim-addons: displaying PIM events in the calendar'
              'appmenu-gtk-module: global menu support for GTK2 and some GTK3 applications'
              'baloo: Baloo search runner' 'discover: manage applications installation from the launcher')
  backup=('etc/pam.d/kde')

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir"/kde.pam "$pkgdir"/etc/pam.d/kde

  # Split plasma-wayland scripts
  rm -r "$pkgdir"/usr/share/wayland-sessions
}

package_plasma-wayland-session() {
  pkgdesc='Plasma Wayland session'
  depends=(plasma-workspace qt5-wayland kwayland-integration xorg-xwayland)
  groups=()

  install -Dm644 build/login-sessions/plasmawayland.desktop "$pkgdir"/usr/share/wayland-sessions/plasmawayland.desktop
}
