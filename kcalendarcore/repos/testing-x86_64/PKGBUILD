# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kcalendarcore
pkgver=5.84.0
pkgrel=1
pkgdesc='The KDE calendar access library'
arch=(x86_64)
url='https://community.kde.org/Frameworks'
license=(LGPL)
depends=(libical qt5-base)
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc)
conflicts=(kcalcore)
provides=(kcalcore)
replaces=(kcalcore)
groups=(kf5)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('8b116cf5dff328597b74a550a938ce3e3a64fcbf7022c692b07691a9dbf35a19'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB) # David Faure <faure@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
