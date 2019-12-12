# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=ffmpegthumbs
pkgver=19.12.0
pkgrel=1
pkgdesc='FFmpeg-based thumbnail creator for video files'
url='https://www.kde.org/applications/multimedia/'
arch=(x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kdemultimedia)
depends=(kio ffmpeg)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('e447be65d522dab4f48938f52c88f37574b0f1b41b68bc45282c5f9e0eaa6025'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
