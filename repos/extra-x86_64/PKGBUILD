# Maintainer: Antonio Rojas <arojas@archlinux,org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=dolphin
pkgver=21.08.0
pkgrel=2
pkgdesc='KDE File Manager'
arch=(x86_64)
url='https://apps.kde.org/dolphin/'
license=(LGPL)
depends=(baloo-widgets knewstuff kio-extras kcmutils kparts kactivities kuserfeedback)
makedepends=(extra-cmake-modules kdoctools)
optdepends=('kde-cli-tools: for editing file type options' 'ffmpegthumbs: video thumbnails' 'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'konsole: terminal panel' 'purpose: share context menu')
groups=(kde-applications kde-system)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/system/dolphin/-/commit/27bfcde4efaf936243fc41e4a61d0cac32105ef6.patch)
sha256sums=('5666dce41371192a897a696d82acb0c8628cb8147372c33fc2b4065c572867a1'
            'SKIP'
            'd0545f020236ebcec5d138dc963ab0fbcac74fd14f45de9559e6a06af8bd3ef4')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

prepare() {
  sed -i 's/KF5_MIN_VERSION "5.81.0"/KF5_MIN_VERSION "5.82.0"/' $pkgname-$pkgver/CMakeLists.txt
  patch -d $pkgname-$pkgver -p1 < 27bfcde4efaf936243fc41e4a61d0cac32105ef6.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
