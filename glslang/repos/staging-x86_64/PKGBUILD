# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>

# Careful when upgrading this package! It usually breaks ABI without bumping soname.
pkgname=glslang
pkgver=7.13.3496
pkgrel=1
pkgdesc='OpenGL and OpenGL ES shader front end and validator'
arch=('x86_64')
url='https://github.com/KhronosGroup/glslang'
license=('BSD')
depends=('gcc-libs' 'spirv-tools' 'python')
makedepends=('cmake' 'ninja')
options=('staticlibs')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/KhronosGroup/glslang/archive/${pkgver}.tar.gz)
sha256sums=('170d1538a670af4cae300e875d7cda9744b1acee1ab7252ecf7c4004186bb922')

build() {
  cd ${pkgname}-${pkgver}
  mkdir -p build-{shared,static}
  (cd build-shared
    cmake .. \
      -GNinja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=ON
    ninja
  )
  (cd build-static
    cmake .. \
      -GNinja \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_SHARED_LIBS=OFF
    ninja
  )
}

package() {
  cd ${pkgname}-${pkgver}
  DESTDIR="${pkgdir}" ninja -C build-shared install
  DESTDIR="${pkgdir}" ninja -C build-static install
  cd "${pkgdir}"/usr/lib
  for lib in *.so; do
    ln -sf "${lib}" "${lib}.0"
  done
}

# vim: ts=2 sw=2 et:
