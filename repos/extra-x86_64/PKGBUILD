# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwin
pkgver=5.24.4
pkgrel=1
pkgdesc='An easy to use, but flexible, composited Window Manager'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(kscreenlocker xcb-util-cursor plasma-framework kcmutils kwayland-server breeze
         pipewire-session-manager libqaccessibilityclient lcms2)
makedepends=(extra-cmake-modules qt5-tools kdoctools krunner)
optdepends=('maliit-keyboard: virtual keyboard for kwin-wayland')
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz{,.sig})
install=$pkgname.install
sha256sums=('e2142321a9b1189665354838a66baeb2189235b705efca2364777bc3a3698ce3'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>
options=(debug)

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
