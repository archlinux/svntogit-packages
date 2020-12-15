# Maintainer: Antonio Rojas <arojas@archlinux,org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=dolphin
pkgver=20.12.0
pkgrel=2
pkgdesc="KDE File Manager"
arch=(x86_64)
url="https://kde.org/applications/system/dolphin/"
license=(LGPL)
depends=(baloo-widgets knewstuff kio-extras kcmutils kparts kinit kactivities kuserfeedback)
makedepends=(extra-cmake-modules kdoctools packagekit-qt5)
optdepends=('kde-cli-tools: for editing file type options' 'ffmpegthumbs: video thumbnails' 'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'konsole: terminal panel' 'purpose: share context menu' 'packagekit-qt5: service menu installer')
groups=(kde-applications kde-system)
source=("https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz"{,.sig}
         kdebug-429628.patch::"https://invent.kde.org/system/dolphin/commit/c95d7fae.patch")
sha256sums=('02b384e85b00aaaf1b4efd7ee7ca9d2f98991b850aa3645b7161219e9087ccd3'
            'SKIP'
            '2292ecf2ba60420a3baadd1a6625e9afab9de13fc50d2cacd33f3054fbcd2d61')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

prepare() {
  patch -d $pkgname-$pkgver -p1 -i ../kdebug-429628.patch # Fix crash
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
