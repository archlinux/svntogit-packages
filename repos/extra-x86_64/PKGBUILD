# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kwin
pkgver=5.26.2.1
pkgrel=2
pkgdesc='An easy to use, but flexible, composited Window Manager'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(kscreenlocker xcb-util-cursor plasma-framework kcmutils breeze
         pipewire-session-manager libqaccessibilityclient lcms2 libxcvt)
makedepends=(extra-cmake-modules qt5-tools kdoctools krunner wayland-protocols plasma-wayland-protocols python)
optdepends=('maliit-keyboard: virtual keyboard for kwin-wayland')
replaces=(kwayland-server)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/plasma/kwin/-/commit/2339f7bf.patch)
install=$pkgname.install
sha256sums=('7c9e921226f85c8f8e835b8bf63ae67da800d6921ba148618e570bf4825f3364'
            'SKIP'
            '12ed726350260507e5305427d967519da56c37e59004139f9ee5f8a9a994f7d6')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>
options=(debug)

prepare() {
  patch -d $pkgname-$pkgver -p1 < 2339f7bf.patch # https://bugs.kde.org/show_bug.cgi?id=461032
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
