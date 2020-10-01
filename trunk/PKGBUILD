# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexey D. <lq07829icatm at rambler.ru>

pkgbase=plasma-workspace
pkgname=(plasma-workspace plasma-wayland-session)
pkgver=5.19.5
pkgrel=3
pkgdesc='KDE Plasma Workspace'
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
depends=(knotifyconfig libksysguard ktexteditor libqalculate kde-cli-tools appstream-qt phonon-qt5
         xorg-xrdb xorg-xsetroot kactivitymanagerd kholidays xorg-xmessage milou prison kwin
         plasma-integration kdelibs4support kpeople kactivities-stats libkscreen kquickcharts kuserfeedback)
makedepends=(extra-cmake-modules kdoctools gpsd baloo networkmanager-qt kdesignerplugin kinit)
groups=(plasma)
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgbase-$pkgver.tar.xz"{,.sig} kde.pam
         plasma-workspace-gpsd-3.21.patch
         kdebug-423526a.patch::"https://invent.kde.org/plasma/plasma-workspace/commit/05414ed5.patch"
         kdebug-423526b.patch::"https://invent.kde.org/plasma/plasma-workspace/commit/bb7b1226.patch")
sha256sums=('490329e08e63016edd696a9132bf80b76ef51dacf53308b865d2e27b67ce8127'
            'SKIP'
            '00090291204baabe9d6857d3b1419832376dd2e279087d718b64792691e86739'
            '27bdc2f751cb6a418d4cf08b08d260ec5621dc3190418fcea9fa80870f857348'
            '7c87253df33c7145eb90082dee1e9ccc19eb650c4715bfde61b67989d5b0650d'
            'ffda98d84a18f6a1111607411c85b18dc20c6d7899b1037c209970b25845d2b0')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  patch -d $pkgbase-$pkgver -p1 -i ../plasma-workspace-gpsd-3.21.patch # Fix build with gpsd 3.21
  patch -d $pkgbase-$pkgver -p1 -i ../kdebug-423526a.patch # Fix switching sessions with systemd 246
  patch -d $pkgbase-$pkgver -p1 -i ../kdebug-423526b.patch

  sed -e 's|dbus-run-session ||' -i $pkgbase-$pkgver/login-sessions/plasmawayland.desktop.cmake # Don't start a second user dbus session
}

build() {
  cmake -B build -S $pkgbase-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package_plasma-workspace() {
  optdepends=('plasma-workspace-wallpapers: additional wallpapers'
              'gpsd: GPS based geolocation' 'networkmanager-qt: IP based geolocation'
              'kdepim-addons: displaying PIM events in the calendar'
              'appmenu-gtk-module: global menu support for GTK2 and some GTK3 applications'
              'qt5-virtualkeyboard: virtual keyboard support in lock screen'
              'baloo: Baloo search runner' 'discover: manage applications installation from the launcher')
  provides=(notification-daemon)
  backup=('etc/pam.d/kde')

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir"/kde.pam "$pkgdir"/etc/pam.d/kde

  # Split plasma-wayland scripts
  rm -r "$pkgdir"/usr/share/wayland-sessions
}

package_plasma-wayland-session() {
  pkgdesc='Plasma Wayland session'
  depends=(plasma-workspace qt5-wayland kwayland-integration xorg-server-xwayland)
  groups=()

  install -Dm644 build/login-sessions/plasmawayland.desktop "$pkgdir"/usr/share/wayland-sessions/plasmawayland.desktop
}
