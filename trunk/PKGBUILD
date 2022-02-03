# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=ffmpegthumbs
pkgver=21.12.2
pkgrel=1
pkgdesc='FFmpeg-based thumbnail creator for video files'
url='https://apps.kde.org/ffmpegthumbs/'
arch=(x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kde-multimedia)
depends=(kio ffmpeg taglib)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig}
        ffmpeg5.patch)
sha256sums=('f95b4d7eeeb10f6e712c6595d19f1a0f5b5ff090d6c65e9dbb36384b6bcc9e9d'
            'SKIP'
            '2a58654d21eb2113377d92bd2faa040506544e09b2934bcfcfdb5df4f77a9bba')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>
options=(debug)

prepare() {
  patch -d $pkgname-$pkgver -p1 < ffmpeg5.patch # Fix build with ffmpeg 5
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
