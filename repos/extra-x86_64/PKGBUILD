# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexey D. <lq07829icatm at rambler.ru>

pkgbase=plasma-workspace
pkgname=(plasma-workspace plasma-wayland-session)
pkgver=5.14.5
pkgrel=2
pkgdesc='KDE Plasma Workspace'
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
depends=(kjsembed knotifyconfig libksysguard ktexteditor libqalculate qt5-tools kde-cli-tools bc
         xorg-xrdb xorg-xsetroot kactivitymanagerd kholidays xorg-xmessage xorg-xprop milou prison kwin
         plasma-integration kdelibs4support)
makedepends=(extra-cmake-modules kdoctools gpsd baloo appstream-qt krunner networkmanager-qt kdesignerplugin)
groups=(plasma)
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgbase-$pkgver.tar.xz"{,.sig} kde.pam
        kdebug-390890.patch::"https://cgit.kde.org/plasma-workspace.git/patch/?id=0885170d")
sha256sums=('903ef4dd2ca3040b2be7435d8f170a9df78a6d05f3525cfa8f212e52b5e5a391'
            'SKIP'
            '00090291204baabe9d6857d3b1419832376dd2e279087d718b64792691e86739'
            '9700eefd38355ec12daa02600086151da41fe55009dbe06ec852b87c94c5df37')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  mkdir -p build

  cd $pkgbase-$pkgver
  patch -p1 -i ../kdebug-390890.patch # Fix system tray breakage after entering configuration
}

build() {
  cd build
  cmake ../$pkgbase-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package_plasma-workspace() {
  optdepends=('plasma-workspace-wallpapers: additional wallpapers'
              'gpsd: GPS based geolocation' 'networkmanager-qt: IP based geolocation'
              'kdepim-addons: displaying PIM events in the calendar'
              'appmenu-qt4: global menu support for Qt4 applications'
              'appmenu-gtk-module: global menu support for GTK2 and some GTK3 applications'
              'qt5-virtualkeyboard: virtual keyboard support in lock screen'
              'baloo: Baloo search runner'
              'appstream-qt: package search runner')
  conflicts=(kuiserver)
  provides=(kuiserver notification-daemon)
  replaces=(kuiserver)
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

  install -Dm644 build/plasmawayland.desktop "$pkgdir"/usr/share/wayland-sessions/plasmawayland.desktop
}
