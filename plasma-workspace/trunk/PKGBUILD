# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexey D. <lq07829icatm at rambler.ru>

pkgbase=plasma-workspace
pkgname=(plasma-workspace plasma-wayland-session)
pkgver=5.17.3
pkgrel=2
pkgdesc='KDE Plasma Workspace'
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
depends=(knotifyconfig libksysguard ktexteditor libqalculate kde-cli-tools appstream-qt
         xorg-xrdb xorg-xsetroot kactivitymanagerd kholidays xorg-xmessage xorg-xprop milou prison kwin
         plasma-integration kdelibs4support kpeople kactivities-stats libkscreen)
makedepends=(extra-cmake-modules kdoctools gpsd baloo networkmanager-qt kdesignerplugin)
groups=(plasma)
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgbase-$pkgver.tar.xz"{,.sig} kde.pam
         kdebug-356937.patch::"https://cgit.kde.org/plasma-workspace.git/patch/?id=5e934611")
sha256sums=('d346271f5b55ead66b02da389aea9e0f5842c01faa5a33d03946d83b083da888'
            'SKIP'
            '00090291204baabe9d6857d3b1419832376dd2e279087d718b64792691e86739'
            '3083a8a18b3b719f6f1a54bf4751c58c85ccbb63c2d533d701f5145bcb4299c5')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
  patch -p1 -i ../kdebug-356937.patch # Fix background of xembed icons
}

build() {
  cd build
  cmake ../$pkgbase-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  make
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

  cd build
  make DESTDIR="$pkgdir" install

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
