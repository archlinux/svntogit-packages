# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=khotkeys
pkgver=5.19.3
pkgrel=1
pkgdesc='KHotKeys'
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
depends=(plasma-workspace)
makedepends=(extra-cmake-modules kdoctools kdesignerplugin kinit)
groups=(plasma)
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('d5664d7426facfae99b9f905c22f4ef8c7c1056f14d2a7f0d7f523585cc9c4d6'
            'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E'  # Jonathan Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
