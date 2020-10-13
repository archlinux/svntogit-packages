# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexey D. <lq07829icatm at rambler.ru>

pkgbase=plasma-workspace
pkgname=(plasma-workspace plasma-wayland-session)
pkgver=5.20.0
pkgrel=2
pkgdesc='KDE Plasma Workspace'
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
depends=(knotifyconfig libksysguard ktexteditor libqalculate kde-cli-tools appstream-qt phonon-qt5
         xorg-xrdb xorg-xsetroot kactivitymanagerd kholidays xorg-xmessage milou prison kwin
         plasma-integration kdelibs4support kpeople kactivities-stats libkscreen kquickcharts kuserfeedback)
makedepends=(extra-cmake-modules kdoctools gpsd baloo networkmanager-qt kdesignerplugin kinit plasma-wayland-protocols)
groups=(plasma)
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgbase-$pkgver.tar.xz"{,.sig} kde.pam
         plasma-workspace-gitk.patch::"https://invent.kde.org/plasma/plasma-workspace/-/commit/ae43cd88.patch")
sha256sums=('20fc599fdfc6477c7315fdf3059bae7ac4843294e550a8d18b6cf1af2ed2b2ca'
            'SKIP'
            '00090291204baabe9d6857d3b1419832376dd2e279087d718b64792691e86739'
            '1d5f51407aa33999a710b7f15fc849f3059931a5fce68c419962504ee4556a72')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  patch -d $pkgbase-$pkgver -p1 -i ../plasma-workspace-gitk.patch # Fix gitk error at runtime
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
