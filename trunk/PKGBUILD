# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=black-hole-solver
pkgver=1.12.0
pkgrel=1
pkgdesc="Solvers and statistics for 'Golf' solitaire, 'Black Hole' solitaire, 'All in a Row' solitaire and related card patience games"
arch=(x86_64)
url='https://www.shlomifish.org/open-source/projects/black-hole-solitaire-solver/'
license=(MIT)
depends=(glibc)
makedepends=(cmake perl-path-tiny rinutils python)
source=(https://fc-solve.shlomifish.org/downloads/fc-solve/black-hole-solver-$pkgver.tar.xz)
sha256sums=('d32f32536f7573292588f41bb0d85ae42d561376c218dc4ab6badfe4904a37a7')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_STATIC_LIBRARY=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $pkgname-$pkgver/COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
