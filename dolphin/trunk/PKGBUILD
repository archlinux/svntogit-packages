# Maintainer: Antonio Rojas <arojas@archlinux,org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=dolphin
pkgver=22.12.0
pkgrel=3
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
        https://invent.kde.org/system/dolphin/-/commit/c8aed8ac.patch
        dolphin-pr480.patch::https://invent.kde.org/system/dolphin/-/merge_requests/480.patch)
sha256sums=('487c04953a7b505a638adce16cb3d4df3a3345ffc27e069d4f84730e4ad6ac26'
            'SKIP'
            'ce74e2e5079ebe2522bf2420c25a74a524cef47502311bb7e602d906813fcf24'
            'df86b0fad61a6be28361456983b462af180bf3fc891ae095fc611a11ba8dee86')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>
options=(debug)

prepare() {
  patch -d $pkgname-$pkgver -p1 < c8aed8ac.patch # Fix copy-pasting issues
  patch -d $pkgname-$pkgver -p1 < dolphin-pr480.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
