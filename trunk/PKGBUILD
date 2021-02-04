# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=ffmpegthumbs
pkgver=20.12.2
pkgrel=1
pkgdesc='FFmpeg-based thumbnail creator for video files'
url='https://www.kde.org/applications/multimedia/'
arch=(x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kde-multimedia)
depends=(kio ffmpeg taglib)
makedepends=(extra-cmake-modules)
source=("https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('6f69dc7bdc45f5ad76c008cc160bd8799c3239f25c6eaea2ad6bca30fa798147'
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
