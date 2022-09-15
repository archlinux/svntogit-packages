# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=flac
pkgname=('flac' 'flac-doc')
pkgver=1.4.0
pkgrel=1
pkgdesc='Free Lossless Audio Codec'
url='https://xiph.org/flac/'
arch=('x86_64')
license=('BSD' 'GPL')
depends=('gcc-libs' 'libogg')
makedepends=('nasm' 'cmake' 'ninja' 'doxygen')
options=('debug')
source=(https://downloads.xiph.org/releases/flac/flac-${pkgver}.tar.xz)
sha512sums=('b7310de7bcf49584c0a1fdc6d5ee7216a8ab3e2b1af85366fa0905752da13e1cbb9638e0d92f3b756568a69848abf4d5c2fe0d21a86c6fdb4840f2678daf0f8d')

prepare() {
  cd flac-${pkgver}

  # Shorten tests
  sed -i 's/FLAC__TEST_LEVEL=1/FLAC__TEST_LEVEL=0/' test/CMakeLists.txt
}

build() {
  cmake -S flac-${pkgver} -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_MANDIR=/usr/share/man/man1 \
    -DBUILD_SHARED_LIBS=ON \
    -DWITH_STACK_PROTECTOR=OFF \
    -DNDEBUG=ON
  cmake --build build

  # Build docs and place them where install expects them
  cmake --build build --target FLAC-doxygen
  mv build/doc/doxytmp/html flac-${pkgver}/doc/api
}

check() {
  cd build
  ctest --output-on-failure --stop-on-failure -j1
}

package_flac() {
  provides=('libFLAC.so' 'libFLAC++.so')

  DESTDIR="${pkgdir}" cmake --install build

  install -Dm 644 flac-${pkgver}/src/*/*.m4 -t "${pkgdir}/usr/share/aclocal"

  mkdir -p doc/usr/share
  mv {"${pkgdir}",doc}/usr/share/doc

  install -Dm 644 flac-${pkgver}/COPYING.Xiph -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

package_flac-doc() {
  pkgdesc+=' documentation'
  depends=()

  mv doc/* "$pkgdir"

  install -Dm 644 flac-${pkgver}/COPYING.Xiph -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set sw=2 sts=-1 et:
