# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=ffmpegthumbs
pkgver=21.12.1
pkgrel=2
pkgdesc='FFmpeg-based thumbnail creator for video files'
url='https://apps.kde.org/ffmpegthumbs/'
arch=(x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kde-multimedia)
depends=(kio ffmpeg taglib)
makedepends=(extra-cmake-modules)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig}
        ffmpeg5.patch)
sha256sums=('e39df38df15171acced19588195e5c137c115bf35e31085aa74fe6e8fb03e1d5'
            'SKIP'
            'ce314c8c98478ed90521e3cabbd125b2fccfb9a12666ca928b80fb4f87e07f52')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

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
