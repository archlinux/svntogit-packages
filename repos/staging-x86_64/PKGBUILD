# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=ffmpegthumbs
pkgver=20.04.3
pkgrel=1
pkgdesc='FFmpeg-based thumbnail creator for video files'
url='https://www.kde.org/applications/multimedia/'
arch=(x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kde-multimedia)
depends=(kio ffmpeg)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('089305a75d32cf8bf1b9279623b524912af78aa538379dcccf998ca1ab165164'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
