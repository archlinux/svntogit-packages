# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=ffmpegthumbs
pkgver=21.08.3
pkgrel=1
pkgdesc='FFmpeg-based thumbnail creator for video files'
url='https://apps.kde.org/ffmpegthumbs/'
arch=(x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kde-multimedia)
depends=(kio ffmpeg taglib)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('60943a88c4a90c228e1588b6d1bd454ae9abfeb613b83195cbc350e1442a8982'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
