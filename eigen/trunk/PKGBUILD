# Maintainer: Ronald van Haren <ronald@archlinux.org>
# Contributor: Chirantan Ekbote <chirantan.ekbote at gmail.com>
# Contributor: Kringel

pkgname=eigen
pkgver=3.4.0
pkgrel=1
pkgdesc='Lightweight C++ template library for vector and matrix math, a.k.a. linear algebra'
arch=(any)
url='https://eigen.tuxfamily.org'
license=(GPL3 LGPL2.1 BSD custom:MPL2 custom:MINPACK)
makedepends=(cmake freeglut gcc-fortran fftw suitesparse boost)
source=(https://gitlab.com/libeigen/eigen/-/archive/$pkgver/$pkgname-$pkgver.tar.gz)
sha256sums=('8586084f71f9bde545ee7fa6d00288b264a2b7ac3607b974e54d13e7162c1c72')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # install custom licenses
  install -Dm644 $pkgname-$pkgver/COPYING.* -t "$pkgdir/usr/share/licenses/$pkgname"
}
