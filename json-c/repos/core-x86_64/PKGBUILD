# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>
# Contributor: congyiwu <congyiwu AT gmail DOT com>

pkgname=json-c
pkgver=0.16
pkgrel=1
pkgdesc="A JSON implementation in C"
url="https://github.com/json-c/json-c/wiki"
license=(MIT)
arch=(x86_64)
depends=(glibc)
makedepends=(git cmake ninja)
provides=(libjson-c.so)
options=(debug)
_commit=2f2ddc1f2dbca56c874e8f9c31b5b963202d80e7  # tags/json-c-0.16-20220414^0
source=("git+https://github.com/json-c/json-c#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd json-c
  local tag="$(git describe --tags --abbrev=0)"
  local ver="$(git describe --tags)"
  echo "${tag%-*}${ver#$tag}" | sed 's/^json-c-//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd json-c
}

build() {
  cmake -S json-c -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_STATIC_LIBS=OFF \
    -DENABLE_THREADING=ON \
    -DENABLE_RDRAND=OFF
  cmake --build build
}

check() {
  cmake --build build --target test
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 json-c/COPYING
}

# vim:set sw=2 et:
