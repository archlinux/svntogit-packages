# Maintainer: Antonio Rojas <arojas@archlinux,org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=dolphin
pkgver=21.08.1
pkgrel=1
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
        27bfcde4.patch)
sha256sums=('6e5dce2629f8333b426074d0f35dc96d40b528948db101443f8270ea554cb3ee'
            'SKIP'
            '9c17ce284b0623982b152fa76418ca3005e31c3977120f1f6bb5be351918e318')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

prepare() {
  patch -d $pkgname-$pkgver -p1 < 27bfcde4.patch # Fix opening terminal without kinit
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
