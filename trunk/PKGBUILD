# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgbase=flac
pkgname=('flac' 'flac-doc')
pkgver=1.3.4
pkgrel=3
pkgdesc='Free Lossless Audio Codec'
url='https://xiph.org/flac/'
arch=('x86_64')
license=('BSD' 'GPL')
depends=('gcc-libs' 'libogg')
makedepends=('nasm' 'doxygen' 'cmake' 'ninja')
source=(https://downloads.xiph.org/releases/flac/flac-${pkgver}.tar.xz
        https://github.com/xiph/flac/commit/b171e767e282909d3f4ef4b7d7fcb9b7d7987ff5.patch)
sha512sums=('4a626e8a1bd126e234c0e5061e3b46f3a27c2065fdfa228fd8cf00d3c7fa2c05fafb5cec36acce7bfce4914bfd7db0b2a27ee15decf2d8c4caad630f62d44ec9'
            '9cfe6b3098f119f2db851d73cebaebc9423cacaefd6555857e7453d63e61e6f7241b4b8e9621e87622498cc6f56ee29cfd4df2a19334f1ffb29b9c27c3bfa312')

prepare() {
  cd flac-${pkgver}

  # https://bugs.archlinux.org/task/74895
  patch -Np1 -i ../b171e767e282909d3f4ef4b7d7fcb9b7d7987ff5.patch
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
}

check() {
  FLAC__TEST_LEVEL=0 cmake --build build --target test
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

# vim:set sw=2 et:
