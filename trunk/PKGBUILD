# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=qqc2-desktop-style
pkgver=5.73.0
pkgrel=2
pkgdesc='A style for Qt Quick Controls 2 to make it follow your desktop theme'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
groups=(kf5)
depends=(kirigami2 kiconthemes)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz"{,.sig}
         kdebug-425949.patch)
sha256sums=('290b3637be0c3740e92cdbb1421aef8bf1a8df36218f9d7d120e8422d14c3fdd'
            'SKIP'
            'f8b58cc70e7d371e99a7a3740260d02285a12200fa0584320638cd1176d74d42')
validpgpkeys=('53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB') # David Faure <faure@kde.org>

prepare() {
  patch -d $pkgname-$pkgver -p1 -i ../kdebug-425949.patch # Fix "add palette" menu in musescore
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
