# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: Antony Male <antony dot male at geemail dot com>>

pkgname=snappy
pkgver=1.1.9
pkgrel=2
pkgdesc='A fast compressor/decompressor library'
arch=('x86_64')
url="https://google.github.io/snappy/"
license=('BSD')
depends=('glibc' 'gcc-libs')
checkdepends=('zlib')
makedepends=('cmake' 'clang' 'gtest' 'benchmark')
source=("https://github.com/google/snappy/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        snappy.pc.in
        cmake_add_pkgconfig.patch
        system_gtest.patch::https://github.com/google/snappy/commit/114df35e84ad95b6d5afbcf69aa85a14ff029000.patch
        reenable_rtti.patch::https://github.com/google/snappy/commit/516fdcca6606502e2d562d20c01b225c8d066739.patch
        fix_inline.patch::https://github.com/google/snappy/pull/128/commits/0c716d435abe65250100c2caea0e5126ac4e14bd.patch)
sha256sums=('75c1fbb3d618dd3a0483bff0e26d0a92b495bbe5059c8b4f1c962b478b6e06e7'
            '134f06ca0584a1026538d0fb972fc141c008390ecae1806184b721eca1abbc75'
            '2a204d7d35509ffc290d80c641fcb7e8488c67ca550aa1695493cff12c53156b'
            'ca96fd9e72f35ea63af82f19ff1ca93441bf5ea6b3f53ef4b974e83c249d8e3e'
            '5c9a3be0cabfc58f091a6ba51b05a1627a39693695ab91a6260cecc982e9a6b5'
            'ad79190b274df5ddabf14eddd2bb0d9a091ee7d44e4afde89febf9a8f783fdce')

prepare() {
  cd "$pkgname-$pkgver"
  cp ../snappy.pc.in .
  patch -p1 < ../cmake_add_pkgconfig.patch # https://bugs.archlinux.org/task/71246
  patch -p1 < ../system_gtest.patch # https://github.com/google/snappy/pull/132
  patch -p1 < ../reenable_rtti.patch # https://bugs.archlinux.org/task/72058
  patch -p1 < ../fix_inline.patch # https://github.com/google/snappy/pull/128
}

build() {
  cd "$pkgname-$pkgver"

  # compile without assertions
  CXXFLAGS+=\ -DNDEBUG

  # export CXX=clang++

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_SHARED_LIBS=yes \
    -DSNAPPY_USE_BUNDLED_GTEST=OFF \
    -DSNAPPY_USE_BUNDLED_BENCHMARK_LIB=OFF \
    .

  make
}

check() {
  # compile without assertions
  CXXFLAGS+=\ -DNDEBUG

  make -C "$pkgname-$pkgver" test
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -m644 -D COPYING "$pkgdir/usr/share/licenses/snappy/LICENSE"
}

# vim:set ts=2 sw=2 et:
